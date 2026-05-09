; DESCRIPTION: Places a blue circle of radius 32 at center (274, 105).
; PLAN: r0=274(x), r1=105(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 105
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
