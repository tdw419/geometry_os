; DESCRIPTION: Renders a orange disk with center (364, 167) and radius 77.
; PLAN: r0=364(x), r1=167(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 167
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
