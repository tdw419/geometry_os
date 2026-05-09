; DESCRIPTION: Creates a green circular shape at (91, 108) with radius 75.
; PLAN: r0=91(x), r1=108(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 108
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
