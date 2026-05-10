; DESCRIPTION: Creates a yellow circular shape at (464, 138) with radius 31.
; PLAN: r0=464(x), r1=138(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 138
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
