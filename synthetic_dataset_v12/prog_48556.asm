; DESCRIPTION: Creates a green circular shape at (175, 78) with radius 35.
; PLAN: r0=175(x), r1=78(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 78
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
