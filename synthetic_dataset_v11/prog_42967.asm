; DESCRIPTION: Creates a blue circular shape at (169, 84) with radius 78.
; PLAN: r0=169(x), r1=84(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 84
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
