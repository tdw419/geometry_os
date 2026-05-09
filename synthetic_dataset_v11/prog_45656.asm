; DESCRIPTION: Creates a yellow circular shape at (55, 121) with radius 49.
; PLAN: r0=55(x), r1=121(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 121
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
