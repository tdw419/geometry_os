; DESCRIPTION: Creates a yellow circular shape at (49, 91) with radius 46.
; PLAN: r0=49(x), r1=91(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 91
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
