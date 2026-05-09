; DESCRIPTION: Creates a yellow circular shape at (123, 168) with radius 78.
; PLAN: r0=123(x), r1=168(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 168
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
