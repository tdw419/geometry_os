; DESCRIPTION: Creates a green circular shape at (111, 200) with radius 38.
; PLAN: r0=111(x), r1=200(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 200
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
