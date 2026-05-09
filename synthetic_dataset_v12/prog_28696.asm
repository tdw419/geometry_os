; DESCRIPTION: Creates a yellow circular shape at (205, 99) with radius 37.
; PLAN: r0=205(x), r1=99(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 99
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
