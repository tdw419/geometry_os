; DESCRIPTION: Creates a blue circular shape at (177, 163) with radius 42.
; PLAN: r0=177(x), r1=163(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 163
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
