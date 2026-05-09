; DESCRIPTION: Creates a blue circular shape at (58, 46) with radius 15.
; PLAN: r0=58(x), r1=46(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 46
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
