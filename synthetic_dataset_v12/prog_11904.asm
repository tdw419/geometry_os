; DESCRIPTION: Creates a purple circular shape at (18, 174) with radius 15.
; PLAN: r0=18(x), r1=174(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 174
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
