; DESCRIPTION: Creates a green circular shape at (433, 136) with radius 36.
; PLAN: r0=433(x), r1=136(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 136
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
