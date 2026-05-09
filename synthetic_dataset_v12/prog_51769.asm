; DESCRIPTION: Creates a blue circular shape at (149, 217) with radius 25.
; PLAN: r0=149(x), r1=217(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 217
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
