//! Resource management for industrial simulation
//!
//! Tracks materials and energy in refinery operations with material balance verification.

use std::collections::HashMap;
use std::fmt;

/// Material types tracked in refinery
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum MaterialType {
    /// Crude oil input
    CrudeOil,
    /// Naphtha output
    Naphtha,
    /// Diesel output
    Diesel,
    /// Gasoline output
    Gasoline,
    /// Byproducts (heavy ends, residue)
    Byproducts,
}

impl fmt::Display for MaterialType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::CrudeOil => write!(f, "Crude Oil"),
            Self::Naphtha => write!(f, "Naphtha"),
            Self::Diesel => write!(f, "Diesel"),
            Self::Gasoline => write!(f, "Gasoline"),
            Self::Byproducts => write!(f, "Byproducts"),
        }
    }
}

/// Energy types tracked in refinery
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum EnergyType {
    /// Steam (utility)
    Steam,
    /// Cooling water (utility)
    CoolingWater,
    /// Electrical power (MW)
    ElectricalPower,
}

impl fmt::Display for EnergyType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Steam => write!(f, "Steam"),
            Self::CoolingWater => write!(f, "Cooling Water"),
            Self::ElectricalPower => write!(f, "Electrical Power (MW)"),
        }
    }
}

/// Resource error types
#[derive(Debug, Clone, PartialEq)]
pub enum ResourceError {
    /// Insufficient resources available
    InsufficientResources(String),
    /// Invalid resource type
    InvalidResourceType,
    /// Negative amount not allowed
    NegativeAmount,
}

impl fmt::Display for ResourceError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::InsufficientResources(resource) => {
                write!(f, "Insufficient {}", resource)
            }
            Self::InvalidResourceType => write!(f, "Invalid resource type"),
            Self::NegativeAmount => write!(f, "Negative amount not allowed"),
        }
    }
}

impl std::error::Error for ResourceError {}

/// Resource balance snapshot for material balance verification
#[derive(Debug, Clone)]
pub struct ResourceSnapshot {
    pub timestamp: f64,
    pub materials: HashMap<MaterialType, f64>,
    pub energy: HashMap<EnergyType, f64>,
}

/// Resource manager for tracking refinery resources
pub struct ResourceManager {
    /// Material inventory (m³)
    materials: HashMap<MaterialType, f64>,
    /// Energy inventory (MW or utility units)
    energy: HashMap<EnergyType, f64>,
    /// Simulation time for balance tracking
    simulation_time: f64,
    /// Balance snapshots over time
    snapshots: Vec<ResourceSnapshot>,
}

impl ResourceManager {
    /// Create a new resource manager
    pub fn new() -> Self {
        let mut materials = HashMap::new();
        let mut energy = HashMap::new();

        // Initialize all material types at zero
        materials.insert(MaterialType::CrudeOil, 0.0);
        materials.insert(MaterialType::Naphtha, 0.0);
        materials.insert(MaterialType::Diesel, 0.0);
        materials.insert(MaterialType::Gasoline, 0.0);
        materials.insert(MaterialType::Byproducts, 0.0);

        // Initialize all energy types at zero
        energy.insert(EnergyType::Steam, 0.0);
        energy.insert(EnergyType::CoolingWater, 0.0);
        energy.insert(EnergyType::ElectricalPower, 0.0);

        ResourceManager {
            materials,
            energy,
            simulation_time: 0.0,
            snapshots: Vec::new(),
        }
    }

    /// Consume material resources
    pub fn consume_material(
        &mut self,
        material: MaterialType,
        amount: f64,
    ) -> Result<(), ResourceError> {
        if amount < 0.0 {
            return Err(ResourceError::NegativeAmount);
        }

        if let Some(current) = self.materials.get_mut(&material) {
            if *current >= amount {
                *current -= amount;
                Ok(())
            } else {
                Err(ResourceError::InsufficientResources(material.to_string()))
            }
        } else {
            Err(ResourceError::InvalidResourceType)
        }
    }

    /// Produce material resources
    pub fn produce_material(
        &mut self,
        material: MaterialType,
        amount: f64,
    ) -> Result<(), ResourceError> {
        if amount < 0.0 {
            return Err(ResourceError::NegativeAmount);
        }

        if let Some(current) = self.materials.get_mut(&material) {
            *current += amount;
            Ok(())
        } else {
            Err(ResourceError::InvalidResourceType)
        }
    }

    /// Consume energy resources
    pub fn consume_energy(
        &mut self,
        energy_type: EnergyType,
        amount: f64,
    ) -> Result<(), ResourceError> {
        if amount < 0.0 {
            return Err(ResourceError::NegativeAmount);
        }

        if let Some(current) = self.energy.get_mut(&energy_type) {
            if *current >= amount {
                *current -= amount;
                Ok(())
            } else {
                Err(ResourceError::InsufficientResources(energy_type.to_string()))
            }
        } else {
            Err(ResourceError::InvalidResourceType)
        }
    }

    /// Produce/generate energy resources
    pub fn produce_energy(
        &mut self,
        energy_type: EnergyType,
        amount: f64,
    ) -> Result<(), ResourceError> {
        if amount < 0.0 {
            return Err(ResourceError::NegativeAmount);
        }

        if let Some(current) = self.energy.get_mut(&energy_type) {
            *current += amount;
            Ok(())
        } else {
            Err(ResourceError::InvalidResourceType)
        }
    }

    /// Get material balance
    pub fn get_material_balance(&self, material: MaterialType) -> Result<f64, ResourceError> {
        self.materials
            .get(&material)
            .copied()
            .ok_or(ResourceError::InvalidResourceType)
    }

    /// Get energy balance
    pub fn get_energy_balance(&self, energy_type: EnergyType) -> Result<f64, ResourceError> {
        self.energy
            .get(&energy_type)
            .copied()
            .ok_or(ResourceError::InvalidResourceType)
    }

    /// Set simulation time
    pub fn set_time(&mut self, time: f64) {
        self.simulation_time = time;
    }

    /// Create a snapshot of current resource state
    pub fn snapshot(&mut self) {
        let snapshot = ResourceSnapshot {
            timestamp: self.simulation_time,
            materials: self.materials.clone(),
            energy: self.energy.clone(),
        };
        self.snapshots.push(snapshot);
    }

    /// Get all material balances
    pub fn get_all_materials(&self) -> &HashMap<MaterialType, f64> {
        &self.materials
    }

    /// Get all energy balances
    pub fn get_all_energy(&self) -> &HashMap<EnergyType, f64> {
        &self.energy
    }

    /// Verify material balance over time (mass conservation)
    ///
    /// Returns true if total material mass is conserved within tolerance
    pub fn verify_material_balance(&self, tolerance: f64) -> bool {
        if self.snapshots.is_empty() {
            return true;
        }

        // Calculate initial total mass
        let initial_mass: f64 = self.snapshots[0]
            .materials
            .values()
            .filter(|&&v| v > 0.0)
            .sum();

        // Calculate current total mass
        let current_mass: f64 = self.materials.values().filter(|&&v| v > 0.0).sum();

        // Check if mass is conserved (within tolerance)
        (current_mass - initial_mass).abs() <= tolerance
    }

    /// Calculate material balance drift since initial snapshot
    pub fn material_balance_drift(&self) -> Option<f64> {
        if self.snapshots.is_empty() {
            return None;
        }

        let initial_mass: f64 = self.snapshots[0]
            .materials
            .values()
            .filter(|&&v| v > 0.0)
            .sum();

        let current_mass: f64 = self.materials.values().filter(|&&v| v > 0.0).sum();

        Some(current_mass - initial_mass)
    }

    /// Get resource consumption rate (change per time unit)
    pub fn get_consumption_rate(&self, material: MaterialType) -> Option<f64> {
        if self.snapshots.len() < 2 {
            return None;
        }

        let latest = &self.snapshots.last()?;
        let previous = &self.snapshots[self.snapshots.len() - 2];

        let latest_val = latest.materials.get(&material)?;
        let prev_val = previous.materials.get(&material)?;

        let delta_time = latest.timestamp - previous.timestamp;

        if delta_time <= 0.0 {
            return None;
        }

        Some((latest_val - prev_val) / delta_time)
    }

    /// Print resource status report
    pub fn status_report(&self) -> String {
        let mut report = String::new();
        report.push_str("═══════════════════════════════════════\n");
        report.push_str(&format!("Resource Report (t={:.1}s)\n", self.simulation_time));
        report.push_str("═══════════════════════════════════════\n");
        report.push_str("\nMaterials (m³):\n");

        for (material, amount) in &self.materials {
            report.push_str(&format!("  {:15}: {:.2}\n", material, amount));
        }

        report.push_str("\nEnergy (MW/units):\n");

        for (energy, amount) in &self.energy {
            report.push_str(&format!("  {:15}: {:.2}\n", energy, amount));
        }

        if let Some(drift) = self.material_balance_drift() {
            report.push_str(&format!("\nMass Balance Drift: {:.6} m³\n", drift));
            let balanced = self.verify_material_balance(0.01);
            report.push_str(&format!("Balance Verified: {}\n", balanced));
        }

        report.push_str("═══════════════════════════════════════\n");

        report
    }
}

impl Default for ResourceManager {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_resource_manager_creation() {
        let rm = ResourceManager::new();

        // All materials should be zero
        assert_eq!(rm.get_material_balance(MaterialType::CrudeOil).unwrap(), 0.0);
        assert_eq!(rm.get_material_balance(MaterialType::Naphtha).unwrap(), 0.0);

        // All energy should be zero
        assert_eq!(rm.get_energy_balance(EnergyType::Steam).unwrap(), 0.0);
        assert_eq!(rm.get_energy_balance(EnergyType::ElectricalPower).unwrap(), 0.0);
    }

    #[test]
    fn test_produce_material() {
        let mut rm = ResourceManager::new();

        rm.produce_material(MaterialType::CrudeOil, 100.0).unwrap();
        assert_eq!(rm.get_material_balance(MaterialType::CrudeOil).unwrap(), 100.0);

        rm.produce_material(MaterialType::CrudeOil, 50.0).unwrap();
        assert_eq!(rm.get_material_balance(MaterialType::CrudeOil).unwrap(), 150.0);
    }

    #[test]
    fn test_consume_material() {
        let mut rm = ResourceManager::new();

        rm.produce_material(MaterialType::CrudeOil, 100.0).unwrap();
        rm.consume_material(MaterialType::CrudeOil, 30.0).unwrap();

        assert_eq!(rm.get_material_balance(MaterialType::CrudeOil).unwrap(), 70.0);
    }

    #[test]
    fn test_insufficient_resources() {
        let mut rm = ResourceManager::new();

        rm.produce_material(MaterialType::CrudeOil, 50.0).unwrap();

        let result = rm.consume_material(MaterialType::CrudeOil, 100.0);
        assert!(result.is_err());

        // Balance should remain unchanged
        assert_eq!(rm.get_material_balance(MaterialType::CrudeOil).unwrap(), 50.0);
    }

    #[test]
    fn test_negative_amount_rejected() {
        let mut rm = ResourceManager::new();

        let result = rm.produce_material(MaterialType::CrudeOil, -10.0);
        assert!(matches!(result, Err(ResourceError::NegativeAmount)));

        let result = rm.consume_material(MaterialType::CrudeOil, -10.0);
        assert!(matches!(result, Err(ResourceError::NegativeAmount)));
    }

    #[test]
    fn test_energy_tracking() {
        let mut rm = ResourceManager::new();

        rm.produce_energy(EnergyType::Steam, 500.0).unwrap();
        rm.produce_energy(EnergyType::ElectricalPower, 100.0).unwrap();

        assert_eq!(rm.get_energy_balance(EnergyType::Steam).unwrap(), 500.0);
        assert_eq!(rm.get_energy_balance(EnergyType::ElectricalPower).unwrap(), 100.0);

        rm.consume_energy(EnergyType::Steam, 200.0).unwrap();
        assert_eq!(rm.get_energy_balance(EnergyType::Steam).unwrap(), 300.0);
    }

    #[test]
    fn test_mass_balance_conservation() {
        let mut rm = ResourceManager::new();
        rm.set_time(0.0);

        // Initial feed
        rm.produce_material(MaterialType::CrudeOil, 1000.0).unwrap();
        rm.snapshot();

        rm.set_time(1.0);

        // Process crude into products (mass conserved)
        rm.consume_material(MaterialType::CrudeOil, 500.0).unwrap();
        rm.produce_material(MaterialType::Naphtha, 200.0).unwrap();
        rm.produce_material(MaterialType::Diesel, 150.0).unwrap();
        rm.produce_material(MaterialType::Gasoline, 100.0).unwrap();
        rm.produce_material(MaterialType::Byproducts, 50.0).unwrap();

        // Total mass should be conserved
        assert!(rm.verify_material_balance(0.01));
    }

    #[test]
    fn test_mass_balance_drift() {
        let mut rm = ResourceManager::new();
        rm.set_time(0.0);

        rm.produce_material(MaterialType::CrudeOil, 1000.0).unwrap();
        rm.snapshot();

        rm.set_time(1.0);
        rm.consume_material(MaterialType::CrudeOil, 100.0).unwrap();

        // Should show -100.0 drift (mass consumed)
        let drift = rm.material_balance_drift().unwrap();
        assert!((drift + 100.0).abs() < 0.01);
    }

    #[test]
    fn test_consumption_rate() {
        let mut rm = ResourceManager::new();
        rm.set_time(0.0);

        rm.produce_material(MaterialType::CrudeOil, 1000.0).unwrap();
        rm.snapshot();

        rm.set_time(5.0);
        rm.consume_material(MaterialType::CrudeOil, 250.0).unwrap();
        rm.snapshot();

        // Rate should be -50.0 m³/s (consumed 250 over 5 seconds)
        let rate = rm.get_consumption_rate(MaterialType::CrudeOil).unwrap();
        assert!((rate + 50.0).abs() < 0.1);
    }
}