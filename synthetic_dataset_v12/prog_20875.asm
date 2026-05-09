; DESCRIPTION: Places a magenta circle of radius 32 at center (148, 158).
; PLAN: r0=148(x), r1=158(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 158
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
