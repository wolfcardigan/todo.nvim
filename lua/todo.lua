local M = {}
local cmd = vim.cmd
local usercmd = vim.api.nvim_create_user_command

function M.todoopen()
	cmd(":vs todo.md")
end

function M.todoclose()
	cmd(":close")
end

function M.todoaddtask()
	cmd(":vs todo.md")
	cmd(":!echo '- [] x' >> todo.md")
	cmd(":checktime %")
end

function M.setup(opts)
	opts = opts or {}

	usercmd("TodoOpen", M.todoopen, {})
	usercmd("TodoClose", M.todoclose, {})
	usercmd("TodoAddTask", M.todoaddtask, {})

	local map = vim.keymap.set
	local close_keymap = "<A-c>"
	local open_keymap = "<A-g>"
	local add_task_keymap = "<A-t>"

	map("n", open_keymap, M.todopen, {
		desc = "Open Todo",
		silent = true,
	})
	map("n", close_keymap, M.todoclose, {
		desc = "Close Todo",
		silent = true,
	})
	map("n", add_task_keymap, M.todoaddtask, {
		desc = "Add Todo Task",
		silent = true,
	})
end

return M
