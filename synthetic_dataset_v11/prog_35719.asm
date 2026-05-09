; DESCRIPTION: Creates a yellow circular shape at (91, 55) with radius 38.
; PLAN: r0=91(x), r1=55(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 55
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
