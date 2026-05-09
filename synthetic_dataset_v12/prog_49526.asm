; DESCRIPTION: Creates a green circular shape at (203, 125) with radius 22.
; PLAN: r0=203(x), r1=125(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 125
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
