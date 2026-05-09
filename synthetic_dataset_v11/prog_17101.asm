; DESCRIPTION: Creates a blue circular shape at (112, 178) with radius 77.
; PLAN: r0=112(x), r1=178(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 178
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
