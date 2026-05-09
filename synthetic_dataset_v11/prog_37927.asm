; DESCRIPTION: Creates a yellow circular shape at (123, 118) with radius 12.
; PLAN: r0=123(x), r1=118(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 118
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
