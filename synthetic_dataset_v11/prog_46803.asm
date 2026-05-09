; DESCRIPTION: Creates a purple circular shape at (174, 171) with radius 66.
; PLAN: r0=174(x), r1=171(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 171
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
