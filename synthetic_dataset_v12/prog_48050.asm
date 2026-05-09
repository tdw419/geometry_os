; DESCRIPTION: Creates a purple circular shape at (303, 174) with radius 37.
; PLAN: r0=303(x), r1=174(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 174
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
