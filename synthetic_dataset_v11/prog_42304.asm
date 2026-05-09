; DESCRIPTION: Creates a purple circular shape at (136, 171) with radius 65.
; PLAN: r0=136(x), r1=171(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 171
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
