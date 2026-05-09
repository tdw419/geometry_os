; DESCRIPTION: Creates a green circular shape at (123, 176) with radius 18.
; PLAN: r0=123(x), r1=176(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 176
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
