# Solution for Task: Track generation time per method

# OpenSpec Proposaal: XWayland Completion Daemon

## Meta Data
- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to handle 1) the XWayland spawn process, 2) the Python agent ready process, 3) XWayland integration code generation with LM Studio, and 4) Window decoration rendering, keyboard/mouse routing, and surface mapping with Wayland.

The proposal will be divided into several sections:

### Proposal: File paths and Python/Rust code requirements
- **File Paths**: These are the file paths that need to be created or modified. The daemon should create these files in the following directory structure:
  - `/home/user/path/to/wm/daemon/data`: This is the default data directory for Geometry OS. The daemon will use this as a base directory for creating necessary files.
    - `wm-completion.sh`: A script that generates the XWayland integration code, using LM Studio.
    - `xwayland.ini`: An ini file that stores configurations for Wayland compositors.
  - `/home/user/path/to/wm/daemon/plugins`: This is a directory to store plugins. The daemon will create necessary directories and files according to the requirements of each plugin.
- **Python/Rust Code Requirements**: Below are some python/rust code snippets that need to be added to the daemon:
  - `wm_completion_gen_code.py`: This is a Python script that generates the XWayland integration code using LM Studio. The script should use the XWayland spawn process to generate the code, and the Python agent ready process to load the generated code.
    ```python
    def gen_xwayland_integration_code(wm_name: str):
        # Create a new XWayland connection
        xwayland = wm_name.lower().replace('-', '_')
        xconn = WaylandX11Connection(xwayland, None)
        
        # Generate the integration code using LM Studio
        with open(path.join(wm_data_dir, f'{wm_name}-completion.sh'), 'r') as f:
            script = f.read()
        
        # Load and execute the script
        if not os.path.exists(f'{wm_data_dir}/{wm_name}.ini'):
            print(f"Loading {f'{wm_name}.ini'}.")
            os.system(f'ln -s /home/{user}/.config/lm-studio/wm.ini {wm_data_dir}/')
            
        # Execute the script
        output = subprocess.run([script, '--no-xprop', f'{wm_name}.*'], stdout=subprocess.PIPE)
        
        return (output.stdout.decode('utf-8').splitlines())
    ```
  - `plugin_gen_code.rs`: This is a Rust code snippet that generates the Wayland plugin code using LM Studio. The code should use the XWayland spawn process to generate the code, and the Python agent ready process to load the generated code.
    ```rust
    fn gen_wayland_plugin(wm: &str) -> Option<Vec<u8>> {
        let script = Path::new("./wm-completion.sh").to_str().unwrap();
        
        // Load and execute the script
        let output = Command::new("/home/user/.config/lm-studio/wm.ini")
            .args(&["--no-xprop", wm, "--gen"])
            .spawn()?
            .output();
        
        if output.status.success() {
            let lines = output.stdout.lines().collect::<Vec<_>>();
            return Some(lines);
        } else {
            println!("Failed to generate Wayland plugin: {:?}", output.stderr);
            return None;
        }
    }
    
    fn gen_wayland_plugin_with_config(wm: &str, config: String) -> Option<Vec<u8>> {
        let (script, config_file) = split_config(&config);
        
        // Load and execute the script with custom configuration file
        let output = Command::new("/home/user/.config/lm-studio/wm.ini")
            .args(&["--no-xprop", wm, "--gen", config_file])
            .spawn()?
            .output();
        
        if output.status.success() {
            let lines = output.stdout.lines().collect::<Vec<_>>();
            return Some(lines);
        } else {
            println!("Failed to generate Wayland plugin: {:?}", output.stderr);
            return None;
        }
    }
    
    fn split_config(config: &str) -> (String, String) {
        let mut splitted = config.split(' ').collect::<Vec<&str>>();
        
        if splitted[1].contains("--") {
            // The first element is a configuration file name
            let filename = &splitted[1];
            splitted.remove(1);
            
            let mut config_file = String::new();
            for line in &mut splitted {
                if line.starts_with("--") {
                    break;
                }
                config_file.push_str(&line + " ");
            }
            config_file = config_file.strip_suffix("\n").unwrap();
            
            (filename, config_file)
        } else {
            // The first element is the plugin name
            splitted.remove(0);
            
            let plugin_name: String = splitted.iter().collect();
            
            if !plugin_name.starts_with("--") {
                println!("Invalid Wayland plugin name: '{}'", plugin_name);
                return ("".to_string(), String::new());
            }
            
            let filename = &plugin_name[2..]; // Remove `--` and leading space
            
            (filename, "")
        }
    }
    
    fn load_wayland_config(config: String) -> Option<String> {
        let config = match Path::new(&config).extension().and_then(|ext| ext.to_str()) {
            Some("xml") => String::from_utf8_lossy(&read_file(&Path::new(&config)).unwrap()).parse(),
            _ => return None, // Not an xml file
        };
        
        let mut config = match config {
            Ok(x) => x,
            Err(_) => return None, // Error parsing XML file
        };
        
        match &mut config.get_child("plugins") {
            Some(ref mut plugins) if plugins.as_slice().iter().all(|p| p.is_leaf()) => {}
            _ => {
                println!("Invalid Wayland plugin configuration: '{}'", config);
                return None; // Invalid XML file
            }
        };
        
        let mut plugins = match &mut config.get_child("plugin") {
            Some(ref mut p) => {
                if !p.is_leaf() || p.get_child("name").and_then(|n| n.as_str()).unwrap().trim().is_empty() {
                    return None; // Invalid XML file
                }
                match &mut p.get_child("config") {
                    Some(ref mut c) => {
                        if !c.is_leaf() || c.get_child("name").and_then(|n| n.as_str()).unwrap().trim().is_empty() {
                            return None; // Invalid XML file
                        }
                    }
                    _ => {}
                };
                Some(p)
            }
            _ => None, // No plugin element found in configuration
        };
        
        match plugins.as_mut().map(|p| p.get_child("name").and_then(|n| n.as_str())) {
            Some("XwmHandler") if !plugins.as_mut().map(|p| p.get_child("name").and_then(|n| n.as_str())).unwrap().is_empty() => None, // XwmHandler plugin already exists in configuration
            _ => plugins.as_mut().map(|p| Some(plugins.len())),
        }
    }
    
    fn create_wayland_plugin(config: String) -> Option<String> {
        match load_wayland_config(config) {
            None => println!("Invalid Wayland plugin configuration: '{}'", config),
            Some(ref name) if name.starts_with("--") || !name.ends_with(".xml") => None, // Not an XML file or starting with "--"
            Some(_) => load_wayland_config(config).map(|x| x.get_child("name").unwrap().as_str()),
        }
    }
    
    fn generate_wayland_plugin(wm: &str, name: Option<&str>, config: String) -> Option<String> {
        if let Some(ref name) = name {
            let mut plugin_name = name.to_string();
            
            match plugin_name.ends_with(".xml") {
                true => plugin_name += ".xwm",
                false => plugin_name += ".xml",
            }
            
            let config = load_wayland_config(config);
            
            if !config.is_some() || !plugin_name.ends_with(".xml") {
                println!("Invalid Wayland plugin configuration: '{}'", config);
                return None; // Invalid XML file or no plugin found
            }
            
            let mut command = format! ("{wm} --config='{}'", wm);
            if !plugin_name.ends_with(".xml") {
                command += &format!(" --name={}", plugin_name);
            } else {
                command += &format! (" --name={},", plugin_name);
            }
            
            let mut args = String::new();
            for arg in config.unwrap()["args"].as_slice().iter() {
                if !arg.is_empty() {
                    args.push(' ');
                    args += &format! ("{}", arg);
                }
            }
            
            let command = format!("{command} {}", command, args);
            println!("Running: {}", command);
        } else if let Some(ref wm) = wm {
            let config = match get_wayland_config(&wm) {
                None => {
                    println!("No Wayland configuration file found for '{}'", wm);
                    return None; // No wayland configuration file or invalid wm
                }
                Some(ref c) => c,
            };
            
            let command = format! ("{wm} --config='{}'", wm);
            println!("Running: {}", command);
        } else {
            println!("Invalid Wayland configuration file or invalid wm");
            return None; // Invalid configuration file or invalid wm
        }
        
        let mut result = String::new();
        let mut stdout = stdout().lock();
        write!(stdout, "{}", command).expect("Failed to write command to console");
        
        let mut stderr = stdout().lock();
        loop {
            match read_to_string(stderr) {
                Ok(_) => break,
                Err(_) => sleep(1),
            }
        }
        
        let result = String::from_utf8(stderr.read().unwrap()).expect("Invalid UTF-8");
        println!("{:?}", result);
        
        Some(result)
    }
    
    fn get_wayland_config(wm: &str) -> Option<String> {
        let mut path = Path::new("etc/X11/xinit/wmdefault");
        if !path.exists() {
            println!("No Wayland configuration file found for '{}'", wm);
            return None; // No wayland configuration file or invalid wm
        }
        
        let mut config = String::new();
        if !path.read_to_string(&mut config).unwrap() {
            println!("Failed to read Wayland configuration file for '{}'", wm);
            return None; // Failed to read from the wayland configuration file or invalid wm
        }
        
        let mut args = String::new();
        for arg in config.split(",") {
            if !arg.trim().is_empty() {
                args += &format! ("{} ", arg);
            }
        }
        
        Some(args)
    }
    
    fn print_result(result: Option<String>) -> String {
        match result {
            None => "No Wayland configuration found".to_owned(),
            Some(_) => format!("Wayland configuration found for '{}'", result.unwrap()),
        }
    }
    
    fn command_line_args(&self) -> Vec<String> {
        let mut args = String::new();
        if let Some(ref cmd) = self.command {
            args += &cmd;
        } else {
            println!("Please provide a command line argument with the 'add-xwayland-completion-daemon' task.");
            return vec![]; // Invalid command line arguments or no command specified
        }
        
        match args.split(",") {
            [arg] => vec![format! ("{} ", arg)],
            _ => vec![args], // Multiple argument values separated by commas, or multiple arguments provided
        }
    }
    
    fn get_command(&self) -> Option<String> {
        match self.command {
            Some(ref cmd) => Some(format!("{}", cmd)),
            None => None, // Command not specified or no command found
        }
    }
}
```