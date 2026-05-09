; DESCRIPTION: Creates a cyan circular shape at (227, 136) with radius 20.
; PLAN: r0=227(x), r1=136(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 136
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
