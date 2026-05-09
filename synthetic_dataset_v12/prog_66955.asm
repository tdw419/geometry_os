; DESCRIPTION: Creates a blue circular shape at (74, 105) with radius 10.
; PLAN: r0=74(x), r1=105(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 105
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
