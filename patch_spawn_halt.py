import re

with open('systems/infinite_map_rs/tests/self_spawning_test.rs', 'r') as f:
    content = f.read()

# I see the problem. In the shader:
#         case 225u: {
#             ...
#             vms[vm_idx].regs[p1] = i; return;
#         }
# `return` exists the current `execute_instruction` function! It DOES NOT increment `pc`.
# So next cycle, the VM executes `SPATIAL_SPAWN` again. And again. And again.
# The shader needs to increment `pc` for `OP_SPATIAL_SPAWN` before `return`, OR the `return` should be a `break` or we just need to increment it.

# Let's check how we can fix this. Since we can't change the shader right now, we can modify our program to `ADD` to PC? Or maybe we just let it be 8 since that's MAX_CYCLES per VM per frame.
# Actually, the quickest fix for the test is to accept that it spawned *at least* one VM and HALTed eventually? No, it never HALTs because it's stuck on SPATIAL_SPAWN.
# Wait, let's fix the WGSL shader.
