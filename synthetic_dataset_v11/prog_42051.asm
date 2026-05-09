; DESCRIPTION: Creates a purple circular shape at (171, 185) with radius 60.
; PLAN: r0=171(x), r1=185(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 185
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
