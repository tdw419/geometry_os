; DESCRIPTION: Places a magenta circle of radius 64 at center (158, 122).
; PLAN: r0=158(x), r1=122(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 122
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
