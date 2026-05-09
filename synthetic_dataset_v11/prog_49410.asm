; DESCRIPTION: Creates a green circular shape at (30, 30) with radius 29.
; PLAN: r0=30(x), r1=30(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 30
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
