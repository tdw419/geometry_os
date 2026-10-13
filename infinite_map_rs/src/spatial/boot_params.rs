//! Boot parameter handling for kernel boot
//!
//! Handles:
//! - Kernel command line parsing
//! - Device tree blob (DTB) parsing
//! - Hypervisor configuration
//! - Boot parameter validation

use std::collections::HashMap;
use std::error::Error;
use std::fmt;

/// Boot parameter errors
#[derive(Debug)]
pub enum BootParamsError {
    InvalidCommandLine(String),
    InvalidDeviceTree(String),
    InvalidHypervisorConfig(String),
    MissingRequiredParameter(String),
    InvalidValue(String),
}

impl fmt::Display for BootParamsError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> fmt::Result {
        match self {
            BootParamsError::InvalidCommandLine(msg) => write!(f, "Invalid command line: {}", msg),
            BootParamsError::InvalidDeviceTree(msg) => write!(f, "Invalid device tree: {}", msg),
            BootParamsError::InvalidHypervisorConfig(msg) => write!(f, "Invalid hypervisor config: {}", msg),
            BootParamsError::MissingRequiredParameter(param) => write!(f, "Missing required parameter: {}", param),
            BootParamsError::InvalidValue(msg) => write!(f, "Invalid value: {}", msg),
        }
    }
}

impl Error for BootParamsError {}

/// Boot parameters passed to kernel
#[derive(Debug, Clone)]
pub struct BootParams {
    pub kernel_cmdline: String,
    pub device_tree_blob: Option<Vec<u8>>,
    pub hypervisor_config: HypervisorConfig,
    pub memory_regions: Vec<MemoryRegion>,
}

/// Hypervisor configuration
#[derive(Debug, Clone)]
pub struct HypervisorConfig {
    pub enable_nested_paging: bool,
    pub enable_second_level_address_translation: bool,
    pub num_vcpus: usize,
    pub spatial_grid_width: usize,
    pub spatial_grid_height: usize,
    pub ecall_guardrails: bool,
}

impl Default for HypervisorConfig {
    fn default() -> Self {
        HypervisorConfig {
            enable_nested_paging: true,
            enable_second_level_address_translation: true,
            num_vcpus: 1,
            spatial_grid_width: 128,
            spatial_grid_height: 64,
            ecall_guardrails: true,
        }
    }
}

/// Memory region description
#[derive(Debug, Clone)]
pub struct MemoryRegion {
    pub base_address: u64,
    pub size: u64,
    pub flags: u32,
    pub name: String,
}

/// Device tree blob header
#[repr(C)]
#[derive(Debug, Clone)]
struct DtbHeader {
    magic: u32,
    totalsize: u32,
    off_dt_struct: u32,
    off_dt_strings: u32,
    off_mem_rsvmap: u32,
    version: u32,
    last_comp_version: u32,
    boot_cpuid_phys: u32,
    size_dt_strings: u32,
    size_dt_struct: u32,
}

/// DTB magic number
const DTB_MAGIC: u32 = 0xd00dfeed;

/// Parse command line arguments into key-value pairs
fn parse_cmdline_args(cmdline: &str) -> Result<HashMap<String, String>, BootParamsError> {
    let mut args = HashMap::new();
    
    for arg in cmdline.split_whitespace() {
        if let Some((key, value)) = arg.split_once('=') {
            args.insert(key.to_string(), value.to_string());
        } else {
            args.insert(arg.to_string(), String::new());
        }
    }
    
    Ok(args)
}

/// Parse hypervisor configuration from command line
fn parse_hypervisor_config(args: &HashMap<String, String>) -> Result<HypervisorConfig, BootParamsError> {
    let mut config = HypervisorConfig::default();
    
    // Parse nested paging
    if args.contains_key("nested_paging") {
        config.enable_nested_paging = parse_bool(args.get("nested_paging").map(|s| s.as_str()))?;
    }

    // Parse second-level address translation
    if args.contains_key("slat") {
        config.enable_second_level_address_translation = parse_bool(args.get("slat").map(|s| s.as_str()))?;
    }

    // Parse vCPUs
    if let Some(vcpus_str) = args.get("num_vcpus") {
        config.num_vcpus = vcpus_str.parse()
            .map_err(|e| BootParamsError::InvalidValue(format!("Invalid num_vcpus: {}", e)))?;
    }

    // Parse spatial grid dimensions
    if let Some(grid_str) = args.get("spatial_grid") {
        let parts: Vec<&str> = grid_str.split('x').collect();
        if parts.len() != 2 {
            return Err(BootParamsError::InvalidValue(
                format!("Invalid spatial_grid format: {}", grid_str)
            ));
        }

        config.spatial_grid_width = parts[0].parse()
            .map_err(|e| BootParamsError::InvalidValue(format!("Invalid grid width: {}", e)))?;
        config.spatial_grid_height = parts[1].parse()
            .map_err(|e| BootParamsError::InvalidValue(format!("Invalid grid height: {}", e)))?;
    }

    // Parse ECALL guardrails
    if args.contains_key("ecall_guardrails") {
        config.ecall_guardrails = parse_bool(args.get("ecall_guardrails").map(|s| s.as_str()))?;
    }
    
    Ok(config)
}

/// Parse boolean from string
fn parse_bool(value: Option<&str>) -> Result<bool, BootParamsError> {
    match value.unwrap_or("") {
        "1" | "yes" | "true" | "on" => Ok(true),
        "0" | "no" | "false" | "off" => Ok(false),
        v => Err(BootParamsError::InvalidValue(format!("Invalid boolean: {}", v))),
    }
}

/// Validate device tree blob
fn validate_dtb(data: &[u8]) -> Result<(), BootParamsError> {
    if data.len() < std::mem::size_of::<DtbHeader>() {
        return Err(BootParamsError::InvalidDeviceTree("Data too short for DTB header".to_string()));
    }
    
    let header = unsafe { &*(data.as_ptr() as *const DtbHeader) };
    
    if header.magic != DTB_MAGIC {
        return Err(BootParamsError::InvalidDeviceTree(
            format!("Invalid DTB magic: 0x{:08x}", header.magic)
        ));
    }
    
    if header.totalsize as usize > data.len() {
        return Err(BootParamsError::InvalidDeviceTree(
            format!("DTB size exceeds data: {} > {}", header.totalsize, data.len())
        ));
    }
    
    // Check version compatibility
    if header.version < 16 || header.version > 17 {
        return Err(BootParamsError::InvalidDeviceTree(
            format!("Unsupported DTB version: {}", header.version)
        ));
    }
    
    Ok(())
}

/// Parse device tree blob (basic validation for now)
fn parse_device_tree(data: &[u8]) -> Result<Vec<u8>, BootParamsError> {
    validate_dtb(data)?;
    Ok(data.to_vec())
}

/// Parse memory regions from command line
fn parse_memory_regions(args: &HashMap<String, String>) -> Result<Vec<MemoryRegion>, BootParamsError> {
    let mut regions = Vec::new();
    
    // Add default memory region
    regions.push(MemoryRegion {
        base_address: 0x80000000,
        size: 512 * 1024 * 1024, // 512 MB
        flags: 0x7, // R|W|X
        name: "ram".to_string(),
    });
    
    // Parse custom memory regions if specified
    if let Some(mem_str) = args.get("memory") {
        for region_spec in mem_str.split(',') {
            let parts: Vec<&str> = region_spec.split('@').collect();
            if parts.len() != 2 {
                return Err(BootParamsError::InvalidValue(
                    format!("Invalid memory region: {}", region_spec)
                ));
            }
            
            let size = parse_size(parts[0])?;
            let base = u64::from_str_radix(parts[1], 16)
                .map_err(|e| BootParamsError::InvalidValue(format!("Invalid base address: {}", e)))?;
            
            regions.push(MemoryRegion {
                base_address: base,
                size: size,
                flags: 0x7,
                name: format!("custom_{}", regions.len()),
            });
        }
    }
    
    Ok(regions)
}

/// Parse size with suffix (K, M, G)
fn parse_size(s: &str) -> Result<u64, BootParamsError> {
    let s = s.trim();
    let (num_str, suffix) = if let Some(pos) = s.find(|c: char| !c.is_numeric()) {
        (&s[..pos], s[pos..].to_uppercase())
    } else {
        (s, String::new())
    };
    
    let base: u64 = num_str.parse()
        .map_err(|e| BootParamsError::InvalidValue(format!("Invalid size: {}", e)))?;
    
    let multiplier = match suffix.as_str() {
        "K" => 1024,
        "M" => 1024 * 1024,
        "G" => 1024 * 1024 * 1024,
        "" => 1,
        s => return Err(BootParamsError::InvalidValue(format!("Unknown size suffix: {}", s))),
    };
    
    Ok(base * multiplier)
}

/// Main boot parameter parsing function
pub fn parse_boot_params(
    cmdline: &str,
    dtb_blob: Option<&[u8]>,
    metadata_config: Option<&str>
) -> Result<BootParams, Box<dyn Error>> {
    if cmdline.is_empty() {
        return Err(Box::new(BootParamsError::MissingRequiredParameter(
            "kernel command line".to_string()
        )));
    }
    
    // Parse command line arguments
    let args = parse_cmdline_args(cmdline)?;
    
    // Parse kernel command line
    let kernel_cmdline = cmdline.to_string();
    
    // Parse device tree blob if provided
    let device_tree_blob = match dtb_blob {
        Some(data) => Some(parse_device_tree(data)?),
        None => None,
    };
    
    // Parse hypervisor configuration
    let hypervisor_config = parse_hypervisor_config(&args)?;
    
    // Parse memory regions
    let memory_regions = parse_memory_regions(&args)?;
    
    Ok(BootParams {
        kernel_cmdline,
        device_tree_blob,
        hypervisor_config,
        memory_regions,
    })
}

/// Validate boot parameters
pub fn validate_boot_params(params: &BootParams) -> Result<(), Box<dyn Error>> {
    // Check command line is not empty
    if params.kernel_cmdline.is_empty() {
        return Err(Box::new(BootParamsError::MissingRequiredParameter(
            "kernel command line".to_string()
        )));
    }
    
    // Check vCPU count is reasonable
    if params.hypervisor_config.num_vcpus == 0 || params.hypervisor_config.num_vcpus > 64 {
        return Err(Box::new(BootParamsError::InvalidHypervisorConfig(
            format!("Invalid num_vcpus: {}", params.hypervisor_config.num_vcpus)
        )));
    }
    
    // Check spatial grid dimensions are reasonable
    if params.hypervisor_config.spatial_grid_width == 0 
        || params.hypervisor_config.spatial_grid_height == 0 {
        return Err(Box::new(BootParamsError::InvalidHypervisorConfig(
            "Invalid spatial grid dimensions".to_string()
        )));
    }
    
    // Check memory regions don't overlap (basic check)
    for (i, region_a) in params.memory_regions.iter().enumerate() {
        for region_b in params.memory_regions.iter().skip(i + 1) {
            let a_end = region_a.base_address + region_a.size;
            let b_end = region_b.base_address + region_b.size;
            
            if !(a_end <= region_b.base_address || b_end <= region_a.base_address) {
                return Err(Box::new(BootParamsError::InvalidHypervisorConfig(
                    format!("Memory regions overlap: {} and {}", region_a.name, region_b.name)
                )));
            }
        }
    }
    
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_bool() {
        assert!(parse_bool(Some("1")).unwrap());
        assert!(parse_bool(Some("yes")).unwrap());
        assert!(parse_bool(Some("true")).unwrap());
        assert!(!parse_bool(Some("0")).unwrap());
        assert!(!parse_bool(Some("no")).unwrap());
        assert!(parse_bool(Some("invalid")).is_err());
    }

    #[test]
    fn test_parse_size() {
        assert_eq!(parse_size("1024").unwrap(), 1024);
        assert_eq!(parse_size("1K").unwrap(), 1024);
        assert_eq!(parse_size("1M").unwrap(), 1024 * 1024);
        assert_eq!(parse_size("1G").unwrap(), 1024 * 1024 * 1024);
        assert!(parse_size("invalid").is_err());
        assert!(parse_size("1X").is_err());
    }

    #[test]
    fn test_parse_cmdline_args() {
        let cmdline = "console=ttyS0 root=/dev/nfs ip=dhcp nested_paging=1 num_vcpus=2";
        let args = parse_cmdline_args(cmdline).unwrap();
        
        assert_eq!(args.get("console"), Some(&"ttyS0".to_string()));
        assert_eq!(args.get("root"), Some(&"/dev/nfs".to_string()));
        assert_eq!(args.get("ip"), Some(&"dhcp".to_string()));
        assert_eq!(args.get("nested_paging"), Some(&"1".to_string()));
        assert_eq!(args.get("num_vcpus"), Some(&"2".to_string()));
    }

    #[test]
    fn test_parse_hypervisor_config() {
        let mut args = HashMap::new();
        args.insert("num_vcpus".to_string(), "4".to_string());
        args.insert("nested_paging".to_string(), "1".to_string());
        
        let config = parse_hypervisor_config(&args).unwrap();
        assert_eq!(config.num_vcpus, 4);
        assert!(config.enable_nested_paging);
    }

    #[test]
    fn test_validate_boot_params() {
        let params = BootParams {
            kernel_cmdline: "console=ttyS0".to_string(),
            device_tree_blob: None,
            hypervisor_config: HypervisorConfig::default(),
            memory_regions: vec![],
        };
        
        assert!(validate_boot_params(&params).is_ok());
    }

    #[test]
    fn test_invalid_vcpus() {
        let params = BootParams {
            kernel_cmdline: "console=ttyS0".to_string(),
            device_tree_blob: None,
            hypervisor_config: HypervisorConfig {
                num_vcpus: 0,
                ..Default::default()
            },
            memory_regions: vec![],
        };
        
        assert!(validate_boot_params(&params).is_err());
    }

    #[test]
    fn test_empty_cmdline() {
        let result = parse_boot_params("", None, None);
        assert!(result.is_err());
    }

    #[test]
    fn test_memory_region_creation() {
        let region = MemoryRegion {
            base_address: 0x80000000,
            size: 1024 * 1024,
            flags: 0x7,
            name: "test".to_string(),
        };
        
        assert_eq!(region.base_address, 0x80000000);
        assert_eq!(region.size, 1024 * 1024);
    }
}