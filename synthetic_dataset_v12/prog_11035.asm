; DESCRIPTION: Creates a green circular shape at (158, 166) with radius 21.
; PLAN: r0=158(x), r1=166(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 166
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
