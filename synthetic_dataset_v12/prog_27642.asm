; DESCRIPTION: Creates a yellow circular shape at (166, 205) with radius 22.
; PLAN: r0=166(x), r1=205(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 205
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
