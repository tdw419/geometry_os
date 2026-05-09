; DESCRIPTION: Creates a green circular shape at (310, 162) with radius 52.
; PLAN: r0=310(x), r1=162(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 162
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
