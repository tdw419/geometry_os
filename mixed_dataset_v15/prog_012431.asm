; DESCRIPTION: Creates a blue circular shape at (130, 71) with radius 39.
; PLAN: r0=130(x), r1=71(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 71
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
