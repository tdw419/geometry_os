; DESCRIPTION: Creates a yellow circular shape at (106, 161) with radius 35.
; PLAN: r0=106(x), r1=161(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 161
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
