; DESCRIPTION: Creates a blue circular shape at (122, 118) with radius 25.
; PLAN: r0=122(x), r1=118(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 118
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
