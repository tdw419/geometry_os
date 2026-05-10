; DESCRIPTION: Renders a green circular shape at (356, 22) with radius 31.
; PLAN: r0=356(x), r1=22(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 22
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
