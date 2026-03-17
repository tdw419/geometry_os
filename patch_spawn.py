import re

with open('systems/infinite_map_rs/tests/self_spawning_test.rs', 'r') as f:
    content = f.read()

# Make the program slightly longer to account for SPATIAL_SPAWN
content = content.replace('let program_len: u32 = 18;', 'let program_len: u32 = 20;')

# Replace the HALT and add SPATIAL_SPAWN before it
# SPATIAL_SPAWN (225) takes p1 as the register holding the entry point.
# We know r1 holds dst_addr + program_len, but we need the original dst_addr.
# We can LDI the dst_addr into r5 and spawn from there, but we are out of loop space if we don't adjust the branch.
# Alternatively, since we just copied the program to 100, we want to SPATIAL_SPAWN at 100.
# We could LDI r5, 100 and then SPATIAL_SPAWN r5. That takes 3 pixels.
new_code = """
            // Addr 17: LDI r5 (spawn address)
            (17, glyph(1, 0, 5, 0)),
            // Addr 18: DATA = 100
            (18, 100u32),
            // Addr 19: SPATIAL_SPAWN r5
            (19, glyph(225, 0, 5, 0)),
            // Addr 20: HALT
            (20, glyph(13, 0, 0, 0)),
"""

# Find the end of the vec![]
content = re.sub(r'// Addr 17: HALT\n\s*\(17, glyph\(13, 0, 0, 0\)\),', new_code.strip(), content)

# Adjust the branch offset. 
# Original: Addr 15: BRANCH, Addr 16: DATA = -7. (15 + 2 + (-7) = 10)
# This stays the same because the loop body hasn't moved, only what happens after the loop.
# But wait, program_len is now 21 (0-20), so we should change it to 21.
content = content.replace('let program_len: u32 = 20;', 'let program_len: u32 = 21;')

# Verify the test name and other hardcoded values
content = content.replace('0..18u32', '0..21u32')
content = content.replace('100-117', '100-120')
content = content.replace('0-17', '0-20')
content = content.replace('18 pixels', '21 pixels')
content = content.replace('18 glyphs', '21 glyphs')
content = content.replace('test_pixels_move_pixels', 'test_pixels_spawn_pixels')
content = content.replace('PIXELS SPAWNED PIXELS: Self-Spawning Glyph', 'PIXELS SPAWNED PIXELS: Self-Spawning Glyph')

with open('systems/infinite_map_rs/tests/self_spawning_test.rs', 'w') as f:
    f.write(content)
