; DESCRIPTION: Creates a green circular shape at (287, 200) with radius 28.
; PLAN: r0=287(x), r1=200(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 200
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
