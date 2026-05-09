; DESCRIPTION: Creates a blue circular shape at (388, 197) with radius 42.
; PLAN: r0=388(x), r1=197(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 197
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
