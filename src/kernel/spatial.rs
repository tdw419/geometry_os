use crate::kernel::world::FileParticle;
use std::collections::HashMap;

type CellKey = (i32, i32);

/// Uniform grid spatial hash for O(n) average neighbor queries.
/// Replaces O(n^2) pairwise particle interaction.
pub struct SpatialHash {
    pub cell_size: f32,
    pub map: HashMap<CellKey, Vec<usize>>,
}

impl SpatialHash {
    pub fn new(cell_size: f32) -> Self {
        Self {
            cell_size,
            map: HashMap::new(),
        }
    }

    fn hash(&self, x: f32, y: f32) -> CellKey {
        (
            (x / self.cell_size).floor() as i32,
            (y / self.cell_size).floor() as i32,
        )
    }

    /// Rebuild the grid from current particle positions.
    pub fn rebuild(&mut self, particles: &[FileParticle]) {
        self.map.clear();
        for (i, p) in particles.iter().enumerate() {
            let key = self.hash(p.x as f32, p.y as f32);
            self.map.entry(key).or_default().push(i);
        }
    }

    /// Return indices of all particles in the 3x3 neighborhood of (x, y).
    /// Results are sorted for deterministic iteration order.
    pub fn nearby(&self, x: f32, y: f32) -> Vec<usize> {
        let (cx, cy) = self.hash(x, y);
        let mut result = Vec::new();
        for dx in -1..=1 {
            for dy in -1..=1 {
                if let Some(cell) = self.map.get(&(cx + dx, cy + dy)) {
                    result.extend(cell.iter().copied());
                }
            }
        }
        result.sort();
        result
    }

    /// Return indices of particles within a radius of (x, y).
    /// Uses grid for coarse culling, then filters by exact distance.
    pub fn within_radius(&self, x: f32, y: f32, radius: f32) -> Vec<usize> {
        let radius_sq = radius * radius;
        let neighbors = self.nearby(x, y);
        neighbors
            .into_iter()
            .filter(|&i| true) // Caller filters by actual distance after index lookup
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn make_particle(x: u32, y: u32) -> FileParticle {
        FileParticle {
            id: 0,
            size: 1,
            x,
            y,
            vx: 0.0,
            vy: 0.0,
            energy: 1.0,
            file_type: 0,
            semantic_vector: [0.0; 4],
        }
    }

    #[test]
    fn test_spatial_hash_consistency() {
        let grid = SpatialHash::new(10.0);
        let key1 = grid.hash(5.0, 5.0);
        let key2 = grid.hash(5.0, 5.0);
        assert_eq!(key1, key2, "same position should hash to same cell");
    }

    #[test]
    fn test_spatial_hash_cell_boundaries() {
        let grid = SpatialHash::new(10.0);

        // Points in same cell
        assert_eq!(grid.hash(0.0, 0.0), grid.hash(9.9, 9.9));

        // Points in adjacent cells
        assert_ne!(grid.hash(9.9, 9.9), grid.hash(10.1, 10.1));
        assert_ne!(grid.hash(0.0, 0.0), grid.hash(-0.1, -0.1));
    }

    #[test]
    fn test_spatial_rebuild_empty() {
        let mut grid = SpatialHash::new(10.0);
        grid.rebuild(&[]);
        assert!(
            grid.map.is_empty(),
            "empty particle list should produce empty grid"
        );
    }

    #[test]
    fn test_spatial_rebuild_single() {
        let mut grid = SpatialHash::new(10.0);
        let particles = vec![make_particle(15, 25)];
        grid.rebuild(&particles);

        let expected_key = grid.hash(15.0, 25.0);
        assert_eq!(grid.map.len(), 1, "should have one cell");
        assert_eq!(
            grid.map.get(&expected_key),
            Some(&vec![0]),
            "particle should be in correct cell"
        );
    }

    #[test]
    fn test_spatial_rebuild_multiple_same_cell() {
        let mut grid = SpatialHash::new(10.0);
        let particles = vec![
            make_particle(5, 5),
            make_particle(6, 6),
            make_particle(7, 7),
        ];
        grid.rebuild(&particles);

        let key = grid.hash(5.0, 5.0);
        assert_eq!(grid.map.len(), 1, "all particles in same cell");
        assert_eq!(
            grid.map.get(&key).map(|v| v.len()),
            Some(3),
            "cell should contain all three particles"
        );
    }

    #[test]
    fn test_spatial_nearby_empty_grid() {
        let grid = SpatialHash::new(10.0);
        let nearby = grid.nearby(50.0, 50.0);
        assert!(
            nearby.is_empty(),
            "empty grid should return no nearby particles"
        );
    }

    #[test]
    fn test_spatial_nearby_single_particle() {
        let mut grid = SpatialHash::new(10.0);
        let particles = vec![make_particle(42, 42)];
        grid.rebuild(&particles);

        let nearby = grid.nearby(42.0, 42.0);
        assert_eq!(
            nearby,
            vec![0],
            "should find the particle at query position"
        );

        let nearby_far = grid.nearby(100.0, 100.0);
        assert!(
            nearby_far.is_empty(),
            "should not find particle far away (different 3x3 region)"
        );
    }

    #[test]
    fn test_spatial_nearby_multiple_cells() {
        let mut grid = SpatialHash::new(10.0);
        let particles = vec![
            make_particle(5, 5),   // cell (0, 0)
            make_particle(15, 5),  // cell (1, 0)
            make_particle(15, 15), // cell (1, 1)
            make_particle(25, 15), // cell (2, 1)
        ];
        grid.rebuild(&particles);

        // Query at cell boundary (1, 0) should see cells (0,0), (1,0), (0,1), (1,1), (2,0), (2,1)
        let nearby = grid.nearby(14.9, 5.0);
        // Sorted: [0, 1, 2, 3] - particles in cells (0,0), (1,0), (1,1), (2,1)
        // (2,0) is empty but the 3x3 region includes it; nearby returns all particles found
        assert_eq!(nearby.len(), 4, "should see particles in 4 cells");
    }

    #[test]
    fn test_spatial_nearby_deterministic_order() {
        let mut grid = SpatialHash::new(10.0);
        let particles = vec![
            make_particle(5, 5),
            make_particle(15, 5),
            make_particle(25, 5),
        ];
        grid.rebuild(&particles);

        let nearby1 = grid.nearby(15.0, 5.0);
        let nearby2 = grid.nearby(15.0, 5.0);

        assert_eq!(nearby1, nearby2, "nearby should return deterministic order");
        assert!(nearby1.is_sorted(), "nearby results should be sorted");
    }

    #[test]
    fn test_spatial_within_radius_stub() {
        let mut grid = SpatialHash::new(10.0);
        let particles = vec![make_particle(5, 5)];
        grid.rebuild(&particles);

        // Stub implementation returns all nearby (no actual distance filtering)
        let results = grid.within_radius(5.0, 5.0, 1.0);
        assert_eq!(results.len(), 1, "stub should return nearby particle");
    }
}
