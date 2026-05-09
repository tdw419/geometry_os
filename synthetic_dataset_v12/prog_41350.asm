; DESCRIPTION: Renders a orange disk with center (137, 205) and radius 36.
; PLAN: r0=137(x), r1=205(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 205
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
