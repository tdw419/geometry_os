; DESCRIPTION: Creates a blue circular shape at (302, 144) with radius 70.
; PLAN: r0=302(x), r1=144(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 144
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
