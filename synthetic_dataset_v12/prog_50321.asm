; DESCRIPTION: Creates a green circular shape at (287, 155) with radius 29.
; PLAN: r0=287(x), r1=155(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 155
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
