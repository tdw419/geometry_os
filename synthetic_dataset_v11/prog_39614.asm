; DESCRIPTION: Creates a green circular shape at (14, 164) with radius 13.
; PLAN: r0=14(x), r1=164(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 164
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
