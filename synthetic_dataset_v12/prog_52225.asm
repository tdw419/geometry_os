; DESCRIPTION: Creates a green circular shape at (432, 205) with radius 34.
; PLAN: r0=432(x), r1=205(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 205
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
