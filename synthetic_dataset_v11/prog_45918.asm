; DESCRIPTION: Creates a green circular shape at (186, 137) with radius 14.
; PLAN: r0=186(x), r1=137(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 137
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
