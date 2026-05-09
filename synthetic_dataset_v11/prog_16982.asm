; DESCRIPTION: Places a magenta circle of radius 42 at center (118, 158).
; PLAN: r0=118(x), r1=158(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 158
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
