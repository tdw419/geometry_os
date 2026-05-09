; DESCRIPTION: Creates a green circular shape at (106, 188) with radius 23.
; PLAN: r0=106(x), r1=188(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 188
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
