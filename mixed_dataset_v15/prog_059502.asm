; DESCRIPTION: Creates a green circular shape at (158, 174) with radius 43.
; PLAN: r0=158(x), r1=174(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 174
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
