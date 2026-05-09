; DESCRIPTION: Creates a green circular shape at (170, 109) with radius 63.
; PLAN: r0=170(x), r1=109(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 109
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
