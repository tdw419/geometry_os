// ═══════════════════════════════════════════════════════════════════════
// GEOS SHELL COMMAND PARSER
//
// A simple command-line shell for Geometry OS.
// Parses text input into commands and produces display output.
//
// Commands:
//   CLS           -- clear screen, reset cursor to top
//   PRINT <text>  -- render text at cursor
//   RUN <program> -- load and execute a .gasm program
//   HELP          -- display available commands
//   VER           -- display "GEOS v1.0"
//
// Unknown commands produce "Unknown command" error.
// Prompt character: ">"
// ═══════════════════════════════════════════════════════════════════════

/// Actions the shell can request from the host environment.
#[derive(Debug, Clone, PartialEq)]
pub enum ShellAction {
    /// Clear all output and reset cursor to top.
    ClearScreen,
    /// Print text at the current cursor position.
    Print { text: String },
    /// Load and execute a .gasm program file.
    Run { filename: String },
}

/// The GEOS shell state.
#[derive(Debug, Clone)]
pub struct Shell {
    /// Lines of text output to display.
    output_lines: Vec<String>,
    /// Current input buffer (characters typed after the prompt).
    input_buffer: String,
    /// Maximum number of output lines to retain.
    max_output_lines: usize,
}

impl Shell {
    /// Create a new shell with a welcome banner.
    pub fn new() -> Self {
        let mut shell = Self {
            output_lines: Vec::new(),
            input_buffer: String::new(),
            max_output_lines: 256,
        };
        shell.output_lines.push("GEOS v1.0".to_string());
        shell
            .output_lines
            .push("Type HELP for available commands.".to_string());
        shell.output_lines.push(String::new());
        shell
    }

    /// Create a shell with custom max output lines (for testing).
    pub fn with_max_lines(max: usize) -> Self {
        let mut shell = Self::new();
        shell.max_output_lines = max;
        shell
    }

    /// Get all output lines for rendering (excludes the current input line).
    pub fn output_lines(&self) -> &[String] {
        &self.output_lines
    }

    /// Get the current input buffer content (what the user has typed).
    pub fn input_buffer(&self) -> &str {
        &self.input_buffer
    }

    /// Get the prompt string.
    pub fn prompt(&self) -> &'static str {
        ">"
    }

    /// Append a typed character to the input buffer.
    pub fn type_char(&mut self, ch: char) {
        self.input_buffer.push(ch);
    }

    /// Delete the last character from the input buffer (backspace).
    pub fn backspace(&mut self) {
        self.input_buffer.pop();
    }

    /// Clear the input buffer without executing.
    pub fn clear_input(&mut self) {
        self.input_buffer.clear();
    }

    /// Press Enter: parse the input buffer, execute the command,
    /// and return any actions the host should perform.
    /// Returns a vector of ShellActions (may be empty).
    pub fn press_enter(&mut self) -> Vec<ShellAction> {
        let raw = self.input_buffer.trim().to_string();
        // Echo the command line (prompt + input) to output
        self.output_lines.push(format!(">{}", self.input_buffer));
        self.input_buffer.clear();

        if raw.is_empty() {
            return Vec::new();
        }

        let actions = self.parse_and_execute(&raw);

        // Trim output if it exceeds max
        if self.output_lines.len() > self.max_output_lines {
            let excess = self.output_lines.len() - self.max_output_lines;
            self.output_lines.drain(..excess);
        }

        actions
    }

    /// Parse a command string and execute it, appending output lines.
    fn parse_and_execute(&mut self, input: &str) -> Vec<ShellAction> {
        // Split into command word and arguments
        let (cmd, args) = split_command(input);

        match cmd {
            "CLS" => {
                self.output_lines.clear();
                vec![ShellAction::ClearScreen]
            }
            "PRINT" => {
                let text = if args.is_empty() {
                    String::new()
                } else {
                    args.to_string()
                };
                self.output_lines.push(text.clone());
                vec![ShellAction::Print { text }]
            }
            "RUN" => {
                let filename = if args.is_empty() {
                    self.output_lines
                        .push("Error: RUN requires a program name".to_string());
                    return Vec::new();
                } else {
                    let fname = args.to_string();
                    // Auto-append .gasm if no extension
                    if fname.contains('.') {
                        fname
                    } else {
                        format!("{}.gasm", fname)
                    }
                };
                self.output_lines.push(format!("Loading {}...", filename));
                vec![ShellAction::Run { filename }]
            }
            "HELP" => {
                self.output_lines.push("Available commands:".to_string());
                self.output_lines
                    .push("  CLS           Clear screen".to_string());
                self.output_lines
                    .push("  PRINT <text>  Print text to screen".to_string());
                self.output_lines
                    .push("  RUN <prog>    Load and run a .gasm program".to_string());
                self.output_lines
                    .push("  HELP          Show this help message".to_string());
                self.output_lines
                    .push("  VER           Show version info".to_string());
                Vec::new()
            }
            "VER" => {
                self.output_lines.push("GEOS v1.0".to_string());
                Vec::new()
            }
            _ => {
                self.output_lines.push(format!("Unknown command: {}", cmd));
                Vec::new()
            }
        }
    }
}

impl Default for Shell {
    fn default() -> Self {
        Self::new()
    }
}

/// Split input into (command, rest_of_line).
/// The command is the first whitespace-delimited token, uppercased.
/// The rest is everything after the first token and its trailing space.
fn split_command(input: &str) -> (&str, &str) {
    let trimmed = input.trim();
    if let Some(space_idx) = trimmed.find(char::is_whitespace) {
        let (cmd, rest) = trimmed.split_at(space_idx);
        (cmd, rest.trim_start())
    } else {
        (trimmed, "")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn enter(shell: &mut Shell, input: &str) -> Vec<ShellAction> {
        shell.input_buffer = input.to_string();
        shell.press_enter()
    }

    // ── CLS ──────────────────────────────────────────────────────────
    #[test]
    fn cls_clears_output_and_returns_action() {
        let mut shell = Shell::new();
        // Initially has welcome lines
        assert!(!shell.output_lines().is_empty());

        let actions = enter(&mut shell, "CLS");
        assert_eq!(actions, vec![ShellAction::ClearScreen]);
        assert!(shell.output_lines().is_empty());
    }

    #[test]
    fn cls_lowercase_is_unknown() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "cls");
        assert!(actions.is_empty());
        // Should have the echo line + unknown command error
        let lines = shell.output_lines();
        assert!(lines.iter().any(|l| l.contains("Unknown command")));
    }

    // ── PRINT ────────────────────────────────────────────────────────
    #[test]
    fn print_outputs_text() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "PRINT Hello World");
        assert_eq!(
            actions,
            vec![ShellAction::Print {
                text: "Hello World".to_string(),
            }]
        );
        // The text should also appear in output_lines
        assert!(shell.output_lines().iter().any(|l| l == "Hello World"));
    }

    #[test]
    fn print_empty_just_outputs_blank() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "PRINT");
        assert_eq!(
            actions,
            vec![ShellAction::Print {
                text: String::new(),
            }]
        );
    }

    #[test]
    fn print_with_special_chars() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "PRINT test 123!@#");
        assert_eq!(
            actions,
            vec![ShellAction::Print {
                text: "test 123!@#".to_string(),
            }]
        );
    }

    // ── RUN ──────────────────────────────────────────────────────────
    #[test]
    fn run_with_program_name() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "RUN myprogram");
        assert_eq!(
            actions,
            vec![ShellAction::Run {
                filename: "myprogram.gasm".to_string(),
            }]
        );
    }

    #[test]
    fn run_with_extension() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "RUN hello.gasm");
        assert_eq!(
            actions,
            vec![ShellAction::Run {
                filename: "hello.gasm".to_string(),
            }]
        );
    }

    #[test]
    fn run_without_argument_shows_error() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "RUN");
        assert!(actions.is_empty());
        assert!(
            shell
                .output_lines()
                .iter()
                .any(|l| l.contains("RUN requires a program name"))
        );
    }

    // ── HELP ─────────────────────────────────────────────────────────
    #[test]
    fn help_lists_commands() {
        let mut shell = Shell::new();
        enter(&mut shell, "HELP");
        let lines = shell.output_lines();
        let help_text = lines.join("\n");
        assert!(help_text.contains("CLS"));
        assert!(help_text.contains("PRINT"));
        assert!(help_text.contains("RUN"));
        assert!(help_text.contains("HELP"));
        assert!(help_text.contains("VER"));
    }

    // ── VER ──────────────────────────────────────────────────────────
    #[test]
    fn ver_shows_version() {
        let mut shell = Shell::new();
        enter(&mut shell, "VER");
        assert!(shell.output_lines().iter().any(|l| l == "GEOS v1.0"));
    }

    // ── Unknown command ──────────────────────────────────────────────
    #[test]
    fn unknown_command_shows_error() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "FOOBAR");
        assert!(actions.is_empty());
        assert!(
            shell
                .output_lines()
                .iter()
                .any(|l| l.contains("Unknown command"))
        );
    }

    #[test]
    fn unknown_command_echoes_name() {
        let mut shell = Shell::new();
        enter(&mut shell, "GARBAGE");
        assert!(shell.output_lines().iter().any(|l| l.contains("GARBAGE")));
    }

    // ── Prompt / input handling ──────────────────────────────────────
    #[test]
    fn prompt_is_greater_than() {
        let shell = Shell::new();
        assert_eq!(shell.prompt(), ">");
    }

    #[test]
    fn type_char_builds_input() {
        let mut shell = Shell::new();
        shell.type_char('H');
        shell.type_char('E');
        shell.type_char('L');
        shell.type_char('P');
        assert_eq!(shell.input_buffer(), "HELP");
    }

    #[test]
    fn backspace_removes_last_char() {
        let mut shell = Shell::new();
        shell.type_char('A');
        shell.type_char('B');
        shell.backspace();
        assert_eq!(shell.input_buffer(), "A");
    }

    #[test]
    fn empty_enter_does_nothing() {
        let mut shell = Shell::new();
        let actions = enter(&mut shell, "");
        assert!(actions.is_empty());
    }

    #[test]
    fn enter_clears_input() {
        let mut shell = Shell::new();
        shell.type_char('V');
        shell.type_char('E');
        shell.type_char('R');
        let _ = shell.press_enter();
        assert_eq!(shell.input_buffer(), "");
    }

    #[test]
    fn enter_echoes_command_to_output() {
        let mut shell = Shell::new();
        enter(&mut shell, "VER");
        assert!(shell.output_lines().iter().any(|l| l == ">VER"));
    }

    #[test]
    fn multiple_commands_accumulate_output() {
        let mut shell = Shell::new();
        enter(&mut shell, "VER");
        enter(&mut shell, "PRINT hello");
        enter(&mut shell, "HELP");
        let lines = shell.output_lines();
        // Should have welcome + echo/command output from multiple commands
        assert!(lines.len() > 5);
    }

    // ── split_command ────────────────────────────────────────────────
    #[test]
    fn split_command_simple() {
        assert_eq!(split_command("PRINT hello"), ("PRINT", "hello"));
    }

    #[test]
    fn split_command_no_args() {
        assert_eq!(split_command("CLS"), ("CLS", ""));
    }

    #[test]
    fn split_command_extra_spaces() {
        assert_eq!(
            split_command("  PRINT   hello world  "),
            ("PRINT", "hello world")
        );
    }

    // ── Welcome message ──────────────────────────────────────────────
    #[test]
    fn new_shell_has_welcome_message() {
        let shell = Shell::new();
        let lines = shell.output_lines();
        assert!(lines.iter().any(|l| l.contains("GEOS")));
        assert!(lines.iter().any(|l| l.contains("HELP")));
    }
}
