; DESCRIPTION: Places a magenta circle of radius 20 at center (93, 82).
; PLAN: r0=93(x), r1=82(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 82
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
