; DESCRIPTION: Creates a yellow circular shape at (185, 123) with radius 27.
; PLAN: r0=185(x), r1=123(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 123
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
