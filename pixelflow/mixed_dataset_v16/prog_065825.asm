; DESCRIPTION: Creates a purple circular shape at (174, 66) with radius 35.
; PLAN: r0=174(x), r1=66(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 66
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
