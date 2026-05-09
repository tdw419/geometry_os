; DESCRIPTION: Creates a green circular shape at (16, 167) with radius 14.
; PLAN: r0=16(x), r1=167(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 167
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
