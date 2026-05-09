; DESCRIPTION: Creates a green circular shape at (172, 188) with radius 46.
; PLAN: r0=172(x), r1=188(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 188
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
