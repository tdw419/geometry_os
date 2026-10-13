//! Self-Boot Loader Binary - Phase 12.4
//!
//! Autonomous PNG boot system that self-initializes and boots Geometry OS
//! from a PNG image file without external intervention.
//!
//! Usage:
//!   cargo run --release --bin self_boot <boot.png>
//!
//! Features:
//! - Auto-detect PNG boot image from configured search paths
//! - Initialize spatial hardware (GPU executor)
//! - Load kernel from PNG
//! - Load initramfs (if configured)
//! - Set boot parameters
//! - Execute kernel autonomously

use infinite_map_rs::spatial::self_boot_loader::{SelfBootLoader, BootConfig, BootState};
use infinite_map_rs::RiscvExecutor;
use log::{error, info};
use std::env;
use std::fs;
use std::path::PathBuf;
use std::time::Duration;

/// Self-boot configuration
#[derive(Debug, Clone)]
struct SelfBootBinaryConfig {
    /// PNG boot image path (optional - will auto-detect if not provided)
    png_path: Option<PathBuf>,
    /// Boot command line arguments
    bootargs: String,
    /// Whether to retry failed boot attempts
    retry_on_failure: bool,
    /// Maximum boot attempts
    max_attempts: u32,
    /// Boot timeout in seconds
    timeout_seconds: u64,
    /// Whether to run in verbose mode
    verbose: bool,
    /// Grid width
    grid_width: usize,
    /// Grid height
    grid_height: usize,
}

impl Default for SelfBootBinaryConfig {
    fn default() -> Self {
        Self {
            png_path: None,
            bootargs: String::from("console=ttyS0 root=/dev/ram0"),
            retry_on_failure: true,
            max_attempts: 3,
            timeout_seconds: 30,
            verbose: true,
            grid_width: 512,
            grid_height: 256,
        }
    }
}

fn parse_args() -> SelfBootBinaryConfig {
    let args: Vec<String> = env::args().collect();
    let mut config = SelfBootBinaryConfig::default();

    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--help" | "-h" => {
                print_usage();
                std::process::exit(0);
            }
            "--png" | "--image" => {
                if i + 1 < args.len() {
                    config.png_path = Some(PathBuf::from(&args[i + 1]));
                    i += 2;
                } else {
                    eprintln!("Error: --png requires a path argument");
                    std::process::exit(1);
                }
            }
            "--bootargs" => {
                if i + 1 < args.len() {
                    config.bootargs = args[i + 1].clone();
                    i += 2;
                } else {
                    eprintln!("Error: --bootargs requires a string argument");
                    std::process::exit(1);
                }
            }
            "--no-retry" => {
                config.retry_on_failure = false;
                i += 1;
            }
            "--max-attempts" => {
                if i + 1 < args.len() {
                    config.max_attempts = args[i + 1].parse().unwrap_or(3);
                    i += 2;
                } else {
                    eprintln!("Error: --max-attempts requires a number argument");
                    std::process::exit(1);
                }
            }
            "--timeout" => {
                if i + 1 < args.len() {
                    config.timeout_seconds = args[i + 1].parse().unwrap_or(30);
                    i += 2;
                } else {
                    eprintln!("Error: --timeout requires a number argument");
                    std::process::exit(1);
                }
            }
            "--quiet" | "-q" => {
                config.verbose = false;
                i += 1;
            }
            "--grid-width" => {
                if i + 1 < args.len() {
                    config.grid_width = args[i + 1].parse().unwrap_or(512);
                    i += 2;
                } else {
                    eprintln!("Error: --grid-width requires a number argument");
                    std::process::exit(1);
                }
            }
            "--grid-height" => {
                if i + 1 < args.len() {
                    config.grid_height = args[i + 1].parse().unwrap_or(256);
                    i += 2;
                } else {
                    eprintln!("Error: --grid-height requires a number argument");
                    std::process::exit(1);
                }
            }
            unknown => {
                // If unknown arg looks like a PNG path, use it
                if unknown.ends_with(".png") {
                    config.png_path = Some(PathBuf::from(unknown));
                    i += 1;
                } else {
                    eprintln!("Error: Unknown argument: {}", unknown);
                    print_usage();
                    std::process::exit(1);
                }
            }
        }
    }

    config
}

fn print_usage() {
    eprintln!("Self-Boot Loader - Phase 12.4");
    eprintln!();
    eprintln!("Usage: {} [OPTIONS] [boot.png]", env::args().next().unwrap());
    eprintln!();
    eprintln!("Options:");
    eprintln!("  --png, --image <path>      PNG boot image path (auto-detect if not provided)");
    eprintln!("  --bootargs <string>        Boot command line arguments (default: 'console=ttyS0 root=/dev/ram0')");
    eprintln!("  --no-retry                 Disable retry on boot failure");
    eprintln!("  --max-attempts <num>       Maximum boot attempts (default: 3)");
    eprintln!("  --timeout <seconds>        Boot timeout in seconds (default: 30)");
    eprintln!("  --quiet, -q                Quiet mode (less output)");
    eprintln!("  --grid-width <num>         Spatial grid width (default: 512)");
    eprintln!("  --grid-height <num>        Spatial grid height (default: 256)");
    eprintln!("  --help, -h                 Show this help message");
    eprintln!();
    eprintln!("Examples:");
    eprintln!("  {} boot.png", env::args().next().unwrap());
    eprintln!("  {} --png boot.png --bootargs 'console=ttyS0 debug'", env::args().next().unwrap());
    eprintln!("  {} # Auto-detect boot image", env::args().next().unwrap());
}

fn setup_logging(verbose: bool) {
    let log_level = if verbose {
        log::LevelFilter::Info
    } else {
        log::LevelFilter::Warn
    };

    env_logger::Builder::new()
        .filter_level(log_level)
        .format_timestamp_secs()
        .init();
}

fn run_boot(config: &SelfBootBinaryConfig) -> Result<(), Box<dyn std::error::Error>> {
    info!("=== Geometry OS Self-Boot Loader ===");
    info!("Phase 12.4: Self-Boot Capability");
    info!("");

    // Initialize GPU executor
    info!("Initializing GPU executor...");

    // TODO: This needs GPU context - for now, we'll use SelfBootLoader
    // which integrates with GPU executor internally
    let mut boot_config = BootConfig {
        bootargs: config.bootargs.clone(),
        initramfs_path: None,
        retry_on_failure: config.retry_on_failure,
        max_attempts: config.max_attempts,
        timeout_seconds: config.timeout_seconds,
        verbose: config.verbose,
    };

    let mut loader = SelfBootLoader::with_config(
        config.grid_width,
        config.grid_height,
        boot_config,
    );

    // Set custom search path if PNG path provided
    if let Some(ref png_path) = config.png_path {
        loader.set_search_paths(vec![png_path.clone()]);
        info!("Using specified PNG: {}", png_path.display());
    } else {
        info!("Auto-detecting PNG boot image...");
    }

    // Execute autonomous boot sequence
    info!("Starting autonomous boot sequence...");
    let boot_result = loader.autonomous_boot();

    match boot_result {
        Ok(()) => {
            info!("");
            info!("=== Boot Successful ===");
            info!("{}", loader.boot_summary());

            // Check boot state
            if loader.boot_state() == BootState::Complete {
                info!("Boot sequence completed successfully!");
                Ok(())
            } else {
                error!("Boot sequence completed but state is not Complete: {:?}", loader.boot_state());
                Err("Boot state mismatch".into())
            }
        }
        Err(e) => {
            error!("=== Boot Failed ===");
            error!("{}", e);
            error!("{}", loader.boot_summary());
            Err(e.into())
        }
    }
}

fn main() {
    let config = parse_args();

    // Setup logging
    setup_logging(config.verbose);

    info!("Self-Boot Loader starting with config: {:?}", config);

    // Run boot sequence
    let result = run_boot(&config);

    // Exit with appropriate code
    match result {
        Ok(()) => {
            info!("Self-boot completed successfully!");
            std::process::exit(0);
        }
        Err(e) => {
            error!("Self-boot failed: {}", e);
            std::process::exit(1);
        }
    }
}