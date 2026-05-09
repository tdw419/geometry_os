; DESCRIPTION: Creates a purple circular shape at (171, 167) with radius 69.
; PLAN: r0=171(x), r1=167(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 167
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
