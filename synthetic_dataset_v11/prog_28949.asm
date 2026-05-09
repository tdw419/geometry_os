; DESCRIPTION: Creates a blue circular shape at (70, 75) with radius 46.
; PLAN: r0=70(x), r1=75(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 75
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
