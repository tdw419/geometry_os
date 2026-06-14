// --- Constants ---
const TAXONOMY_LOGIC: u32 = 1u;
const TAXONOMY_ROUTER: u32 = 2u;
const TAXONOMY_CLOCK: u32 = 3u;
const TAXONOMY_SIGNAL: u32 = 12u; // 0xC
const TAXONOMY_MATTER: u32 = 13u; // 0xD
const TAXONOMY_WIRE: u32 = 14u;   // 0xE (idle)
const TAXONOMY_WIRE_ACTIVE: u32 = 15u; // 0xF (relaying -- reverts to idle next tick)

// Directions (bits 24-27)
const DIR_RIGHT: u32 = 0u;
const DIR_DOWN: u32 = 1u;
const DIR_LEFT: u32 = 2u;
const DIR_UP: u32 = 3u;

// Fanout Bits
const FANOUT_RIGHT: u32 = 1u;
const FANOUT_DOWN: u32 = 2u;
const FANOUT_LEFT: u32 = 4u;
const FANOUT_UP: u32 = 8u;

// Logic Types (bits 24-27)
const LOGIC_XOR: u32 = 0u;
const LOGIC_AND: u32 = 1u;
const LOGIC_OR: u32 = 2u;
const LOGIC_ADD: u32 = 4u;
const LOGIC_NOT: u32 = 3u;
const LOGIC_NEURON: u32 = 5u;
const LOGIC_XOR_MULTI: u32 = 6u;
const LOGIC_BRANCH: u32 = 8u;

struct SubstrateParams {
    width: u32, height: u32, time: u32, clock: u32, mutation_rate: f32,
}

@group(0) @binding(0) var<storage, read> input_substrate: array<u32>;
@group(0) @binding(1) var<storage, read_write> output_substrate: array<u32>;
@group(0) @binding(2) var<uniform> params: SubstrateParams;

fn hash(u: u32) -> u32 {
    var x = u;
    x = ((x >> 16u) ^ x) * 0x45d9f3bu;
    x = ((x >> 16u) ^ x) * 0x45d9f3bu;
    x = (x >> 16u) ^ x;
    return x;
}

fn get_pixel(x: i32, y: i32) -> u32 {
    if x < 0 || x >= i32(params.width) || y < 0 || y >= i32(params.height) { return 0u; }
    return input_substrate[u32(y) * params.width + u32(x)];
}

fn is_matter(p: u32) -> bool { return (p >> 28u) == 13u; }
fn is_signal(p: u32) -> bool { return (p >> 28u) == 12u; }
fn is_logic(p: u32) -> bool { return (p >> 28u) == 1u; }
fn is_router(p: u32) -> bool { return (p >> 28u) == 2u; }
fn is_clock(p: u32) -> bool { return (p >> 28u) == 3u; }
fn is_wire(p: u32) -> bool { return (p >> 28u) == 14u; }
fn is_wire_active(p: u32) -> bool { return (p >> 28u) == 15u; }

// A signal or active wire acts as a signal source for adjacent cells.
fn is_signal_source(p: u32) -> bool {
    let tax = p >> 28u;
    return tax == 12u || tax == 15u;
}

fn get_dir(p: u32) -> u32 { return (p >> 24u) & 15u; }
fn get_logic_type(p: u32) -> u32 { return (p >> 24u) & 15u; }
fn get_fanout_mask(p: u32) -> u32 { return (p >> 24u) & 15u; }

fn signal_heading_right_at(px: i32, py: i32) -> bool {
    let s = get_pixel(px - 1, py);
    return is_signal_source(s) && get_dir(s) == DIR_RIGHT;
}
fn signal_heading_left_at(px: i32, py: i32) -> bool {
    let s = get_pixel(px + 1, py);
    return is_signal_source(s) && get_dir(s) == DIR_LEFT;
}
fn signal_heading_down_at(px: i32, py: i32) -> bool {
    let s = get_pixel(px, py - 1);
    return is_signal_source(s) && get_dir(s) == DIR_DOWN;
}
fn signal_heading_up_at(px: i32, py: i32) -> bool {
    let s = get_pixel(px, py + 1);
    return is_signal_source(s) && get_dir(s) == DIR_UP;
}

fn count_signals_in(px: i32, py: i32) -> u32 {
    var c = 0u;
    if signal_heading_right_at(px, py) { c++; }
    if signal_heading_left_at(px, py) { c++; }
    if signal_heading_down_at(px, py) { c++; }
    if signal_heading_up_at(px, py) { c++; }
    return c;
}

@compute @workgroup_size(8, 8)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let x = i32(id.x); let y = i32(id.y);
    if x >= i32(params.width) || y >= i32(params.height) { return; }
    let idx = u32(y) * params.width + u32(x);
    let current = input_substrate[idx];

    if (params.mutation_rate < 1.0) {
        let h = hash(u32(idx) ^ hash(params.time));
        if (f32(h) / 4294967295.0 > params.mutation_rate) {
            output_substrate[idx] = current;
            return;
        }
    }

    if is_logic(current) || is_router(current) || is_clock(current) { output_substrate[idx] = current; return; }

    if is_wire_active(current) {
        // Revert to idle wire, preserving the weight (bits 16-23)
        // Clear the active payload (bits 0-15)
        let weight = current & 0x00FF0000u;
        output_substrate[idx] = (TAXONOMY_WIRE << 28u) | (get_dir(current) << 24u) | weight;
        return;
    }

    if is_wire(current) {
        let wire_dir = get_dir(current);
        let weight_val = (current >> 16u) & 0xFFu; // 8-bit weight
        
        let gns = array<vec2<i32>, 4>(vec2<i32>(x-1, y), vec2<i32>(x, y-1), vec2<i32>(x+1, y), vec2<i32>(x, y+1));
        let gds = array<u32, 4>(DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP);
        var sig_payload = 0u;
        var has_sig = false;
        
        for (var j = 0u; j < 4u; j++) {
            let sn = get_pixel(gns[j].x, gns[j].y);
            if (sn >> 28u) == 12u && get_dir(sn) == gds[j] { // Signal hits wire
                // The signal payload is 24 bits, but for NNs we might use the lower 16 bits
                let input_val = sn & 0xFFFFu; 
                // Weighted propagation: Input * Weight
                let weighted_val = (input_val * weight_val) >> 8u;
                sig_payload = weighted_val & 0xFFFFu;
                has_sig = true;
                break;
            } else if (sn >> 28u) == 15u && get_dir(sn) == gds[j] { // Active wire hits wire
                sig_payload = sn & 0xFFFFu; // Forward the already-weighted payload
                has_sig = true;
                break;
            }
        }

        if has_sig {
            let preserved_weight = current & 0x00FF0000u;
            output_substrate[idx] = (TAXONOMY_WIRE_ACTIVE << 28u) | (wire_dir << 24u) | preserved_weight | sig_payload;
        } else {
            output_substrate[idx] = current;
        }
        return;
    }

    if is_matter(current) {
        var next_val = current;
        var pushed = false;
        
        // --- Heat-Based Spatial Defrag (Middle-Out) ---
        let payload = current & 16777215u;
        let is_hot = (payload & 0x800000u) != 0u; // Bit 23 is heat bit
        let dist = abs(128 - x) + abs(128 - y);
        
        // Gravity: Pull hot matter toward center
        if is_hot && dist > 20 {
            let dx = 128 - x;
            let dy = 128 - y;
            var dir = 0u;
            var move_dir = 0u;
            if abs(dx) > abs(dy) {
                if dx > 0 { move_dir = DIR_RIGHT; } else { move_dir = DIR_LEFT; }
            } else {
                if dy > 0 { move_dir = DIR_DOWN; } else { move_dir = DIR_UP; }
            }

            // Every few ticks, matter far from center emits a "pull" request
            if (params.time % 8u) == 0u {
                 // ...
            }
        }

        if is_signal(get_pixel(x-1, y)) && get_dir(get_pixel(x-1, y)) == DIR_RIGHT && get_pixel(x+1, y) == 0u { pushed = true; }
        else if is_signal(get_pixel(x+1, y)) && get_dir(get_pixel(x+1, y)) == DIR_LEFT && get_pixel(x-1, y) == 0u { pushed = true; }
        else if is_signal(get_pixel(x, y-1)) && get_dir(get_pixel(x, y-1)) == DIR_DOWN && get_pixel(x, y+1) == 0u { pushed = true; }
        else if is_signal(get_pixel(x, y+1)) && get_dir(get_pixel(x, y+1)) == DIR_UP && get_pixel(x, y-1) == 0u { pushed = true; }
        
        if pushed { output_substrate[idx] = 0u; } else { output_substrate[idx] = current; }
        return;
    }

    var next = 0u;
    if current == 0u {
        // --- Gravity & Repulsion Signal Generation (Middle-Out) ---
        let ds = array<u32, 4>(DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP);
        let dxs = array<i32, 4>(1, 0, -1, 0);
        let dys = array<i32, 4>(0, 1, 0, -1);
        
        for (var i = 0u; i < 4u; i++) {
            let mx = x + dxs[i];
            let my = y + dys[i];
            let tx = x + 2 * dxs[i];
            let ty = y + 2 * dys[i];
            
            let matter = get_pixel(mx, my);
            let tgt = get_pixel(tx, ty);
            
            if is_matter(matter) && tgt == 0u {
                let is_hot = (matter & 0x00800000u) != 0u;
                let m_dist = abs(128 - mx) + abs(128 - my);
                let t_dist = abs(128 - tx) + abs(128 - ty);
                
                // Gravity: Pull HOT matter toward center
                if is_hot && t_dist < m_dist {
                    if (params.time % 16u) == 0u {
                        next = (TAXONOMY_SIGNAL << 28u) | (ds[i] << 24u) | 0x101010u; // Gray pull
                        break;
                    }
                }
                
                // Repulsion: Push COLD matter toward edges
                if !is_hot && t_dist > m_dist {
                    if (params.time % 16u) == 0u {
                        next = (TAXONOMY_SIGNAL << 28u) | (ds[i] << 24u) | 0x200000u; // Red push
                        break;
                    }
                }
            }
        }

        if next == 0u {
            if is_matter(get_pixel(x-1, y)) && is_signal(get_pixel(x-2, y)) && get_dir(get_pixel(x-2, y)) == DIR_RIGHT {
                next = get_pixel(x-1, y);
            } else if is_matter(get_pixel(x+1, y)) && is_signal(get_pixel(x+2, y)) && get_dir(get_pixel(x+2, y)) == DIR_LEFT {
                next = get_pixel(x+1, y);
            } else if is_matter(get_pixel(x, y-1)) && is_signal(get_pixel(x, y-2)) && get_dir(get_pixel(x, y-2)) == DIR_DOWN {
                next = get_pixel(x, y-1);
            } else if is_matter(get_pixel(x, y+1)) && is_signal(get_pixel(x, y+2)) && get_dir(get_pixel(x, y+2)) == DIR_UP {
                next = get_pixel(x, y+1);
            }
        }

        if next == 0u {
            let ns = array<vec2<i32>, 4>(vec2<i32>(x-1, y), vec2<i32>(x, y-1), vec2<i32>(x+1, y), vec2<i32>(x, y+1));
            let ods = array<u32, 4>(DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP);
            let fanout_masks = array<u32, 4>(FANOUT_RIGHT, FANOUT_DOWN, FANOUT_LEFT, FANOUT_UP);
            
            for (var i = 0u; i < 4u; i++) {
                let cell = get_pixel(ns[i].x, ns[i].y);
                let gx = ns[i].x; let gy = ns[i].y;
                
                if is_logic(cell) {
                    let sigs_in = count_signals_in(gx, gy);
                    let lt = get_logic_type(cell);
                    
                    var combined_color = 0u;
                    if lt == LOGIC_AND { combined_color = 16777215u; }
                    
                    let gns = array<vec2<i32>, 4>(vec2<i32>(gx-1, gy), vec2<i32>(gx, gy-1), vec2<i32>(gx+1, gy), vec2<i32>(gx, gy+1));
                    let gds = array<u32, 4>(DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP);
                    
                    for (var j = 0u; j < 4u; j++) {
                        let sn = get_pixel(gns[j].x, gns[j].y);
                        if is_signal_source(sn) && get_dir(sn) == gds[j] {
                            let scolor = sn & 16777215u;
                            if lt == LOGIC_AND { combined_color = combined_color & scolor; }
                            else if lt == LOGIC_OR { combined_color = combined_color | scolor; }
                            else if lt == LOGIC_XOR || lt == LOGIC_XOR_MULTI { combined_color = combined_color ^ scolor; }
                            else if lt == LOGIC_ADD { combined_color = (combined_color + scolor) & 16777215u; }
                        }
                    }

                    var fire = false;
                    if lt == LOGIC_AND && sigs_in >= 2u { fire = true; }
                    else if lt == LOGIC_XOR && sigs_in == 1u { fire = true; }
                    else if lt == LOGIC_XOR_MULTI && sigs_in >= 1u { fire = true; }
                    else if lt == LOGIC_OR && sigs_in >= 1u { fire = true; }
                    else if lt == LOGIC_ADD && sigs_in >= 2u { fire = true; }
                    else if lt == LOGIC_NOT && sigs_in == 0u { fire = true; combined_color = 16777215u ^ (cell & 16777215u); }
                    else if lt == LOGIC_NEURON {
                        let threshold = cell & 65535u; // Bits 0-15
                        var total_payload = 0u;
                        
                        let gns2 = array<vec2<i32>, 4>(vec2<i32>(gx-1, gy), vec2<i32>(gx, gy-1), vec2<i32>(gx+1, gy), vec2<i32>(gx, gy+1));
                        let gds2 = array<u32, 4>(DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP);
                        
                        for (var j = 0u; j < 4u; j++) {
                            let sn = get_pixel(gns2[j].x, gns2[j].y);
                            if is_signal_source(sn) && get_dir(sn) == gds2[j] {
                                // Extract ONLY the 16-bit signal payload, ignoring the 8-bit wire weight
                                total_payload += (sn & 0xFFFFu);
                            }
                        }
                        
                        if total_payload >= threshold && total_payload > 0u {
                            fire = true;
                            combined_color = total_payload & 16777215u;
                        }
                    }
                    else if lt == LOGIC_BRANCH {
                        // Placeholder for Phase O iteration
                        if sigs_in >= 1u { fire = true; }
                    }

                    if fire { next = (12u << 28u) | (ods[i] << 24u) | (combined_color); break; }
                } else if is_router(cell) {
                    let sigs_in = count_signals_in(gx, gy);
                    let mask = get_fanout_mask(cell);
                    if sigs_in > 0u && (mask & fanout_masks[i]) != 0u {
                        next = (TAXONOMY_SIGNAL << 28u) | (ods[i] << 24u) | (cell & 16777215u);
                        break;
                    }
                } else if is_clock(cell) {
                    if params.clock == 1u {
                        next = (TAXONOMY_SIGNAL << 28u) | (ods[i] << 24u) | (cell & 16777215u);
                        break;
                    }
                }
            }
        }

        if next == 0u {
            let ns = array<vec2<i32>, 4>(vec2<i32>(x-1, y), vec2<i32>(x, y-1), vec2<i32>(x+1, y), vec2<i32>(x, y+1));
            let ods = array<u32, 4>(DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP);
            for (var i = 0u; i < 4u; i++) {
                let n = get_pixel(ns[i].x, ns[i].y);
                if is_signal_source(n) && get_dir(n) == ods[i] {
                    next = (TAXONOMY_SIGNAL << 28u) | (get_dir(n) << 24u) | (n & 16777215u);
                    break;
                }
            }
        }

    } else if is_signal(current) {
        let dir = get_dir(current);
        var tx = x; var ty = y;
        if dir == DIR_RIGHT { tx += 1; } else if dir == DIR_DOWN { ty += 1; }
        else if dir == DIR_LEFT { tx -= 1; } else if dir == DIR_UP { ty -= 1; }
        let target_p = get_pixel(tx, ty);
        if is_matter(target_p) {
            var cp = false;
            if dir == DIR_RIGHT && get_pixel(tx+1, ty) == 0u { cp = true; }
            else if dir == DIR_DOWN && get_pixel(tx, ty+1) == 0u { cp = true; }
            else if dir == DIR_LEFT && get_pixel(tx-1, ty) == 0u { cp = true; }
            else if dir == DIR_UP && get_pixel(tx, ty-1) == 0u { cp = true; }
            if !cp { let nd = (dir + 2u) % 4u; next = (current & 4043309055u) | (nd << 24u); }
        } else if is_logic(target_p) || is_router(target_p) || is_clock(target_p) {
            next = 0u;
        } else if is_wire(target_p) {
            next = 0u;
        } else if is_wire_active(target_p) {
            next = 0u;
        } else if target_p != 0u {
            let nd = (dir + 2u) % 4u; next = (current & 4043309055u) | (nd << 24u);
        }
    }
    output_substrate[idx] = next;
}
