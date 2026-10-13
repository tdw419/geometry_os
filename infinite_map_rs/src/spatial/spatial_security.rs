// Spatial Security System

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
pub enum SecurityLevel {
    Untrusted,
    Basic,
    Trusted,
    Privileged,
}

impl std::fmt::Display for SecurityLevel {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SecurityLevel::Untrusted => write!(f, "Untrusted"),
            SecurityLevel::Basic => write!(f, "Basic"),
            SecurityLevel::Trusted => write!(f, "Trusted"),
            SecurityLevel::Privileged => write!(f, "Privileged"),
        }
    }
}

#[derive(Debug, Clone)]
pub struct SecurityPolicy {
    pub level: SecurityLevel,
}

#[derive(Debug, Clone)]
pub enum SecurityError {
    UnauthorizedAllocation,
    UnauthorizedFree,
    InvalidRegion,
    ProcessNotFound,
}

pub struct AuditEntry {
    pub pid: u32,
    pub action: String,
    pub success: bool,
}

pub struct SpatialSecurity {
    pub process_levels: std::collections::HashMap<u32, SecurityLevel>,
    pub region_access: std::collections::HashMap<u32, Vec<u32>>,
    pub audit_log: Vec<AuditEntry>,
}

impl SpatialSecurity {
    pub fn new() -> Self {
        SpatialSecurity {
            process_levels: std::collections::HashMap::new(),
            region_access: std::collections::HashMap::new(),
            audit_log: Vec::new(),
        }
    }

    pub fn register_process(&mut self, pid: u32, level: SecurityLevel) -> Result<(), SecurityError> {
        self.process_levels.insert(pid, level);
        self.audit_log.push(AuditEntry {
            pid,
            action: "Register Process".to_string(),
            success: true,
        });
        Ok(())
    }

    pub fn grant_region_access(&mut self, pid: u32, region_id: u32) -> Result<(), SecurityError> {
        if !self.process_levels.contains_key(&pid) {
            return Err(SecurityError::ProcessNotFound);
        }
        
        let access = self.region_access.entry(pid).or_insert_with(Vec::new);
        if !access.contains(&region_id) {
            access.push(region_id);
        }
        
        self.audit_log.push(AuditEntry {
            pid,
            action: format!("Grant Access to Region {}", region_id),
            success: true,
        });
        
        Ok(())
    }

    pub fn validate_allocation(&mut self, process_id: u32, size: u32, base: u32, limit: u32) -> Result<(), SecurityError> {
        let level = self.process_levels.get(&process_id).unwrap_or(&SecurityLevel::Untrusted);
        if level == &SecurityLevel::Untrusted {
            self.audit_log.push(AuditEntry {
                pid: process_id,
                action: "Allocate Memory".to_string(),
                success: false,
            });
            return Err(SecurityError::UnauthorizedAllocation);
        }
        Ok(())
    }

    pub fn validate_free(&mut self, process_id: u32, ptr: u32) -> Result<(), SecurityError> {
        let level = self.process_levels.get(&process_id).unwrap_or(&SecurityLevel::Untrusted);
        if level == &SecurityLevel::Untrusted {
            self.audit_log.push(AuditEntry {
                pid: process_id,
                action: "Free Memory".to_string(),
                success: false,
            });
            return Err(SecurityError::UnauthorizedFree);
        }
        Ok(())
    }

    pub fn get_audit_log(&self) -> &Vec<AuditEntry> {
        &self.audit_log
    }

    pub fn get_violation_count(&self, pid: u32) -> usize {
        self.audit_log.iter().filter(|e| e.pid == pid && !e.success).count()
    }
}