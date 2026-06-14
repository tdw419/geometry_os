use std::collections::BTreeMap;

pub struct SIT {
    pub map: BTreeMap<u64, (u32, u32)>, // FileID -> position
}

impl SIT {
    pub fn new() -> Self {
        Self {
            map: BTreeMap::new(),
        }
    }

    pub fn update(&mut self, id: u64, pos: (u32, u32)) {
        self.map.insert(id, pos);
    }

    pub fn get(&self, id: u64) -> Option<(u32, u32)> {
        self.map.get(&id).copied()
    }
}
