; DESCRIPTION: Creates a green circular shape at (193, 101) with radius 54.
; PLAN: r0=193(x), r1=101(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 101
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
