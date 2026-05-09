; DESCRIPTION: Creates a blue circular shape at (430, 165) with radius 77.
; PLAN: r0=430(x), r1=165(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 165
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
