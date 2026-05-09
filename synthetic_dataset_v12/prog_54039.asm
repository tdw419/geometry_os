; DESCRIPTION: Places a magenta circle of radius 32 at center (101, 95).
; PLAN: r0=101(x), r1=95(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 95
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
