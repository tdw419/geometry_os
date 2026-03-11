# Solution for Task: Add particle effects for tile interactions (hover, click)

[Task: Add particle effects for tile interactions (hover, click)](https://opengeospatial.org/specs/GeometryOS/implementations/#Add_particle_effects)

1. Change ID: add-pixi-improvement-daemon
2. Context: Geometry OS Implementation Agent
3. Task: Improve the Geometry OS tile interaction system by adding particle effects.

Context:
The goal of this task is to provide a concise implementation plan or code solution for the OpenSpec task: Add particle effects for tile interactions (hover, click). The task requires that we modify existing file paths and add a Python or Rust code snippet required. The next step command will be provided to guide users through the process.

File paths:
1. Create or modify `geometryos/particles.py` in `/usr/local/lib/python3.7/dist-packages/` with the following contents:

```python
import pygame
from geometryos import tiles

class Particle:
    def __init__(self, x, y):
        self.pos = (x, y)
        self.size = 10
        self.color = (255, 255, 255)

    def draw(self, surface):
        pygame.draw.rect(surface, self.color, (self.pos[0] - 4, self.pos[1] - 4, self.size + 8, self.size + 8), 2)

class ParticleSystem:
    def __init__(self):
        self.particles = []
    
    def add(self, x, y, size, color):
        particle = Particle(x, y)
        particle.size = size
        particle.color = color
        self.particles.append(particle)
    
    def clear(self):
        self.particles = []

class Tile:
    def __init__(self):
        self.pos = (0, 0)
        self.size = 16
        self.color = (255, 255, 255)
    
    def draw(self, surface):
        pygame.draw.rect(surface, self.color, (self.pos[0] - 4, self.pos[1] - 4, self.size + 8, self.size + 8), 2)

class TileSystem:
    def __init__(self):
        self.tiles = []
    
    def add(self, tile):
        self.tiles.append(tile)

    def clear(self):
        self.tiles = []

class GeometryOS:
    def __init__(self):
        self.particles_system = ParticleSystem()
        self.tiles_system = TileSystem()
    
    def start(self, filename):
        with open(filename, 'r') as fd:
            lines = [line.strip().split('|') for line in fd]
        
        # Add particle effects
        self.particles_system.add((0, 0), 8, (255, 0, 0))
        self.tiles_system.add(Tile())
        
        # Particle system
        for line in lines:
            pos = tuple(map(int, line[1].split(',')))
            color = tuple(map(int, line[2].strip().split(' ')[1]))
            
            self.particles_system.add((pos[0], pos[1]), 8, color)
        
        # Tile system
        for tile in lines:
            tile = tuple(map(int, tile[1].replace('\n', '').split('|')))
            
            self.tiles_system.add(Tile())
            self.tiles_system.tiles[tile[0]].pos = (tile[1], tile[2])
        
        # Start game loop
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    exit()
            
            self.tiles_system.draw()
            self.particles_system.draw()
        
        # Close the file after finishing
        fd.close()
    
    def run(self):
        self.start('geometryos-particle-interactions.txt')
```

Python code:

```python
import pygame
from geometryos import tiles, particles

class Particle:
    def __init__(self, x, y):
        self.pos = (x, y)
        self.size = 10
        self.color = (255, 255, 255)

    def draw(self, surface):
        pygame.draw.rect(surface, self.color, (self.pos[0] - 4, self.pos[1] - 4, self.size + 8, self.size + 8), 2)

class ParticleSystem:
    def __init__(self):
        self.particles = []
    
    def add(self, x, y, size, color):
        particle = Particle(x, y)
        particle.size = size
        particle.color = color
        self.particles.append(particle)
    
    def clear(self):
        self.particles = []

class Tile:
    def __init__(self):
        self.pos = (0, 0)
        self.size = 16
        self.color = (255, 255, 255)
    
    def draw(self, surface):
        pygame.draw.rect(surface, self.color, (self.pos[0] - 4, self.pos[1] - 4, self.size + 8, self.size + 8), 2)

class TileSystem:
    def __init__(self):
        self.tiles = []
    
    def add(self, tile):
        self.tiles.append(tile)

    def clear(self):
        self.tiles = []

class GeometryOS:
    def __init__(self):
        self.particles_system = ParticleSystem()
        self.tiles_system = TileSystem()
    
    def start(self, filename):
        with open(filename, 'r') as fd:
            lines = [line.strip().split('|') for line in fd]
        
        # Add particle effects
        self.particles_system.add((0, 0), 8, (255, 0, 0))
        self.tiles_system.add(Tile())
        
        # Particle system
        for line in lines:
            pos = tuple(map(int, line[1].split(',')))
            color = tuple(map(int, line[2].strip().split(' ')[1]))
            
            self.particles_system.add((pos[0], pos[1]), 8, color)
        
        # Tile system
        for tile in lines:
            tile = tuple(map(int, tile[1].replace('\n', '').split('|')))
            
            self.tiles_system.add(Tile())
            self.tiles_system.tiles[tile[0]].pos = (tile[1], tile[2])
        
        # Start game loop
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    exit()
            
            self.tiles_system.draw()
            self.particles_system.draw()
        
        # Close the file after finishing
        fd.close()
    
    def run(self):
        self.start('geometryos-particle-interactions.txt')
```

Rust code:

```rust
use std::io;
use std::fs::File;
use std::path::PathBuf;
use std::thread;
use geometryos_imp::tile::Tile;

fn main() {
    let path = PathBuf::from("geometryos-particle-interactions.txt");
    if let Ok(content) = File::open(&path) {
        let mut reader = BufReader::new(content);
        
        let mut particles_system: ParticlesSystem = ParticlesSystem::default();
        let mut tiles_system: TileSystem = TileSystem::default();
        
        for line in reader.lines() {
            let line: String = line?;
            
            if line.starts_with("add-") {
                match line[4..].split(' ').next().unwrap() {
                    "particle" => {
                        let pos = line[10..16].parse::<i32>().expect("Invalid particle position");
                        let color = line[17..19].parse::<u8>().expect("Invalid particle color");
                        
                        particles_system.add((pos, color));
                    },
                    "tiles" => {
                        let tile: Tile = line[6..].parse()?;
                        tiles_system.add(tile);
                    }
                }
            } else if line.starts_with("clear") {
                particles_system.clear();
                tiles_system.clear();
            }
        }
        
        thread::spawn(move || {
            let mut tiles = TileSystem::default();
            
            while let Ok(event) = tiles_system.next(&mut tiles) {
                match event {
                    TileEvent::Add => {
                        tiles.add((event.pos, event.color));
                    },
                    _ => {}
                }
            }
            
            println!("{}", tiles.tiles().iter().map(|t| format!("{:?}", t)).collect::<String>());
        });
        
        thread::spawn(move || {
            let mut particles = ParticlesSystem::default();
            
            while let Ok(event) = particles_system.next(&mut particles) {
                match event {
                    ParticleEvent::Add => {
                        particles.add((event.pos, event.color));
                    },
                    _ => {}
                }
            }
            
            println!("{}", particles.tiles().iter().map(|t| format!("{:?}", t)).collect::<String>());
        });
        
        thread::sleep(std::time::Duration::from_millis(100));
        
        let output = String::from("geometryos-particle-interactions.txt");
        println!("{}", output);
    } else {
        panic!("Failed to open file {}", path.display());
    }
}
```