; DESCRIPTION: Creates a green circular shape at (357, 101) with radius 59.
; PLAN: r0=357(x), r1=101(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 101
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
