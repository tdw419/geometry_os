; DESCRIPTION: Creates a green circular shape at (86, 188) with radius 65.
; PLAN: r0=86(x), r1=188(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 188
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
