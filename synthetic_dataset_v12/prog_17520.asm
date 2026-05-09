; DESCRIPTION: Creates a green circular shape at (278, 84) with radius 70.
; PLAN: r0=278(x), r1=84(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 84
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
