// exploration.rs -- Autonomous exploration and mapping (Phase 204)
//
// Implements BFS exploration frontier, map memory, spiral exploration,
// and the building discovery API for autonomous Memory Palace navigation.

use crate::pathfinding::Point;
use serde::{Deserialize, Serialize};
use std::collections::{HashSet, VecDeque};

/// A building discovered during exploration.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DiscoveredBuilding {
    pub building_id: u32,
    pub x: i32,
    pub y: i32,
    pub name: String,
    pub discovered_at_step: usize,
}

/// Exploration log returned after autonomous exploration.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ExplorationLog {
    pub discovered_buildings: Vec<DiscoveredBuilding>,
    pub tiles_visited: usize,
    pub steps_taken: usize,
    pub final_position: Point,
}

/// Exploration constraints to bound the search.
#[derive(Debug, Clone)]
pub struct ExplorationConstraints {
    /// Maximum Manhattan distance from spawn point.
    pub max_radius: Option<i32>,
    /// Maximum steps before stopping.
    pub max_steps: Option<usize>,
    /// Stop after discovering this many buildings.
    pub max_buildings: Option<usize>,
    /// Spawn/reference point.
    pub spawn_point: Point,
}

impl Default for ExplorationConstraints {
    fn default() -> Self {
        ExplorationConstraints {
            max_radius: Some(100),
            max_steps: Some(10000),
            max_buildings: Some(20),
            spawn_point: Point::new(0, 0),
        }
    }
}

/// BFS exploration frontier for systematic coverage.
#[derive(Debug, Clone, Default)]
pub struct ExplorationFrontier {
    /// Visited coordinates.
    pub visited: HashSet<Point>,
    /// Unvisited frontier coordinates (BFS queue).
    pub frontier: VecDeque<Point>,
    /// Discovered buildings.
    pub discovered_buildings: Vec<DiscoveredBuilding>,
    /// Total steps taken.
    pub steps: usize,
}

impl ExplorationFrontier {
    pub fn new(spawn: Point) -> Self {
        let mut frontier = VecDeque::new();
        frontier.push_back(spawn);

        let mut visited = HashSet::new();
        visited.insert(spawn);

        ExplorationFrontier {
            visited,
            frontier,
            discovered_buildings: Vec::new(),
            steps: 0,
        }
    }

    /// Get the next unvisited coordinate (BFS order).
    pub fn pop_frontier(&mut self) -> Option<Point> {
        self.frontier.pop_front()
    }

    /// Add unvisited neighbors to the frontier.
    pub fn expand_frontier(&mut self, point: Point) {
        for neighbor in point.neighbors() {
            if !self.visited.contains(&neighbor) {
                self.visited.insert(neighbor);
                self.frontier.push_back(neighbor);
            }
        }
    }

    /// Record a discovered building.
    pub fn record_building(&mut self, building: DiscoveredBuilding) {
        self.discovered_buildings.push(building);
    }

    /// Check if exploration should stop based on constraints.
    pub fn should_stop(&self, constraints: &ExplorationConstraints) -> bool {
        if let Some(max_radius) = constraints.max_radius {
            // Check the frontier front's distance from spawn
            if let Some(front) = self.frontier.front() {
                let dist = front.manhattan_distance(&constraints.spawn_point);
                if dist > max_radius {
                    return true;
                }
            }
        }

        if let Some(max_steps) = constraints.max_steps {
            if self.steps >= max_steps {
                return true;
            }
        }

        if let Some(max_buildings) = constraints.max_buildings {
            if self.discovered_buildings.len() >= max_buildings {
                return true;
            }
        }

        false
    }

    /// Run autonomous exploration loop.
    /// Calls `building_detector` at each visited position to find buildings.
    pub fn explore(
        &mut self,
        constraints: ExplorationConstraints,
        mut building_detector: impl FnMut(Point) -> Option<DiscoveredBuilding>,
    ) -> ExplorationLog {
        while let Some(point) = self.pop_frontier() {
            if self.should_stop(&constraints) {
                break;
            }

            // Check for buildings at this position
            if let Some(building) = building_detector(point) {
                self.record_building(building);
            }

            // Expand frontier to neighbors
            self.expand_frontier(point);
            self.steps += 1;

            // Early exit if frontier exhausted (all reachable cells visited)
            if self.frontier.is_empty() {
                break;
            }
        }

        let final_position = self
            .visited
            .iter()
            .last()
            .copied()
            .unwrap_or(constraints.spawn_point);

        ExplorationLog {
            discovered_buildings: self.discovered_buildings.clone(),
            tiles_visited: self.visited.len(),
            steps_taken: self.steps,
            final_position,
        }
    }
}

/// Map memory — sparse set of visited coordinates.
/// Used to track which tiles have been explored.
#[derive(Debug, Clone, Default)]
pub struct MapMemory {
    visited: HashSet<Point>,
    buildings_at: Vec<(Point, u32)>,
}

impl MapMemory {
    pub fn new() -> Self {
        MapMemory {
            visited: HashSet::new(),
            buildings_at: Vec::new(),
        }
    }

    /// Mark a tile as visited.
    pub fn visit(&mut self, point: Point) {
        self.visited.insert(point);
    }

    /// Check if a tile has been visited.
    pub fn has_visited(&self, point: &Point) -> bool {
        self.visited.contains(point)
    }

    /// Record a discovered building at a location.
    pub fn record_building(&mut self, point: Point, building_id: u32) {
        self.buildings_at.push((point, building_id));
    }

    /// Get building ID at a location, if any.
    pub fn get_building(&self, point: &Point) -> Option<u32> {
        self.buildings_at
            .iter()
            .find(|(p, _)| p == point)
            .map(|(_, id)| *id)
    }

    /// Get all visited coordinates.
    pub fn visited_coordinates(&self) -> Vec<Point> {
        self.visited.iter().copied().collect()
    }

    /// Number of visited tiles.
    pub fn visited_count(&self) -> usize {
        self.visited.len()
    }

    /// Number of discovered buildings.
    pub fn building_count(&self) -> usize {
        self.buildings_at.len()
    }
}

/// Spiral exploration strategy: explores outward in an expanding spiral.
#[derive(Debug, Clone)]
pub struct SpiralExplorer {
    center: Point,
    radius: i32,
    angle: f64,
    step_size: i32,
}

impl SpiralExplorer {
    pub fn new(center: Point, step_size: i32) -> Self {
        SpiralExplorer {
            center,
            radius: 0,
            angle: 0.0,
            step_size,
        }
    }

    /// Get next position in the spiral.
    pub fn next_position(&mut self) -> Point {
        let x = self.center.x + (self.radius as f64 * self.angle.cos()).round() as i32;
        let y = self.center.y + (self.radius as f64 * self.angle.sin()).round() as i32;

        self.angle += 0.5;
        if self.angle >= 2.0 * std::f64::consts::PI {
            self.angle = 0.0;
            self.radius += self.step_size;
        }

        Point::new(x, y)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_exploration_frontier_creation() {
        let spawn = Point::new(0, 0);
        let frontier = ExplorationFrontier::new(spawn);

        assert_eq!(frontier.visited.len(), 1);
        assert!(frontier.visited.contains(&spawn));
        assert_eq!(frontier.frontier.len(), 1);
        assert_eq!(frontier.steps, 0);
    }

    #[test]
    fn test_exploration_frontier_expand() {
        let spawn = Point::new(0, 0);
        let mut frontier = ExplorationFrontier::new(spawn);

        frontier.expand_frontier(spawn);

        // Should have added 4 neighbors to the initial spawn
        assert_eq!(frontier.frontier.len(), 5); // spawn + 4 neighbors
        assert_eq!(frontier.visited.len(), 5); // spawn + 4 neighbors
    }

    #[test]
    fn test_exploration_constraints_max_steps() {
        let spawn = Point::new(0, 0);
        let mut frontier = ExplorationFrontier::new(spawn);

        let constraints = ExplorationConstraints {
            max_steps: Some(5),
            ..Default::default()
        };

        let detector = |_p: Point| -> Option<DiscoveredBuilding> { None };

        let log = frontier.explore(constraints, detector);
        assert!(log.steps_taken <= 5);
    }

    #[test]
    fn test_exploration_constraints_max_buildings() {
        let spawn = Point::new(0, 0);
        let mut frontier = ExplorationFrontier::new(spawn);

        let constraints = ExplorationConstraints {
            max_buildings: Some(2),
            ..Default::default()
        };

        let mut building_id = 0u32;
        let detector = move |p: Point| {
            building_id += 1;
            Some(DiscoveredBuilding {
                building_id,
                x: p.x,
                y: p.y,
                name: format!("Building {}", building_id),
                discovered_at_step: building_id as usize,
            })
        };

        let log = frontier.explore(constraints, detector);
        assert_eq!(log.discovered_buildings.len(), 2);
    }

    #[test]
    fn test_map_memory() {
        let mut memory = MapMemory::new();

        let p1 = Point::new(5, 10);
        memory.visit(p1);

        assert!(memory.has_visited(&p1));
        assert!(!memory.has_visited(&Point::new(0, 0)));
        assert_eq!(memory.visited_count(), 1);

        memory.record_building(p1, 42);
        assert_eq!(memory.get_building(&p1), Some(42));
    }

    #[test]
    fn test_spiral_explorer() {
        let center = Point::new(0, 0);
        let mut explorer = SpiralExplorer::new(center, 1);

        let p1 = explorer.next_position();
        let p2 = explorer.next_position();

        // First position is center (radius=0, angle=0)
        assert_eq!(p1, center);

        // Advance until radius > 0 (takes ~13 steps with angle step 0.5)
        // At radius > 0, positions should diverge from center
        let mut all_same = true;
        for _ in 0..20 {
            let p = explorer.next_position();
            if p != center {
                all_same = false;
                break;
            }
        }
        assert!(!all_same, "spiral should eventually diverge from center");
    }

    #[test]
    fn test_exploration_log_structure() {
        let log = ExplorationLog {
            discovered_buildings: vec![],
            tiles_visited: 100,
            steps_taken: 100,
            final_position: Point::new(10, 10),
        };

        assert_eq!(log.tiles_visited, 100);
        assert_eq!(log.steps_taken, 100);
        assert_eq!(log.final_position, Point::new(10, 10));
    }

    #[test]
    fn test_building_discovery_in_exploration() {
        let spawn = Point::new(0, 0);
        let mut frontier = ExplorationFrontier::new(spawn);

        // Create a detector that finds a building only at (1, 0)
        let detector = |p: Point| {
            if p == Point::new(1, 0) {
                Some(DiscoveredBuilding {
                    building_id: 1,
                    x: 1,
                    y: 0,
                    name: "Test Building".to_string(),
                    discovered_at_step: 1,
                })
            } else {
                None
            }
        };

        let constraints = ExplorationConstraints {
            max_steps: Some(10),
            ..Default::default()
        };

        let log = frontier.explore(constraints, detector);
        assert_eq!(log.discovered_buildings.len(), 1);
        assert_eq!(log.discovered_buildings[0].name, "Test Building");
    }
}
