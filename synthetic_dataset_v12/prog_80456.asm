; DESCRIPTION: Places a black circle of radius 32 at center (274, 175).
; PLAN: r0=274(x), r1=175(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 175
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
