; DESCRIPTION: Creates a purple circular shape at (303, 203) with radius 18.
; PLAN: r0=303(x), r1=203(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 203
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
