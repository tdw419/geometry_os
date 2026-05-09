; DESCRIPTION: Creates a green circular shape at (106, 70) with radius 44.
; PLAN: r0=106(x), r1=70(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 70
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
