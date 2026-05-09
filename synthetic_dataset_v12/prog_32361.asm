; DESCRIPTION: Creates a blue circular shape at (382, 98) with radius 58.
; PLAN: r0=382(x), r1=98(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 98
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
