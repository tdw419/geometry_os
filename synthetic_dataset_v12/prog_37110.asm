; DESCRIPTION: Places a magenta circle of radius 15 at center (256, 95).
; PLAN: r0=256(x), r1=95(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 95
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
