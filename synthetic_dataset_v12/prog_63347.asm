; DESCRIPTION: Places a magenta circle of radius 32 at center (209, 154).
; PLAN: r0=209(x), r1=154(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 154
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
