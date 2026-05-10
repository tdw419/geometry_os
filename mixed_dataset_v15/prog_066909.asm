; DESCRIPTION: Creates a black circular shape at (216, 174) with radius 63.
; PLAN: r0=216(x), r1=174(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 174
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
