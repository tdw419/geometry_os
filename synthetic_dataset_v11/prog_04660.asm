; DESCRIPTION: Creates a green circular shape at (111, 192) with radius 49.
; PLAN: r0=111(x), r1=192(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 192
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
