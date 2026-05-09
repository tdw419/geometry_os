; DESCRIPTION: Places a magenta circle of radius 64 at center (271, 158).
; PLAN: r0=271(x), r1=158(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 158
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
