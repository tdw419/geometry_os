; DESCRIPTION: Creates a yellow circular shape at (244, 125) with radius 22.
; PLAN: r0=244(x), r1=125(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 125
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
