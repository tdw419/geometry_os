; DESCRIPTION: Creates a green circular shape at (313, 101) with radius 65.
; PLAN: r0=313(x), r1=101(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 101
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
