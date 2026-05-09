; DESCRIPTION: Creates a green circular shape at (22, 90) with radius 21.
; PLAN: r0=22(x), r1=90(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 90
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
