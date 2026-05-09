; DESCRIPTION: Creates a yellow circular shape at (81, 100) with radius 55.
; PLAN: r0=81(x), r1=100(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 100
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
