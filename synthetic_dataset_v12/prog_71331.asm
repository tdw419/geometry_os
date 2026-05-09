; DESCRIPTION: Renders a orange disk with center (364, 163) and radius 12.
; PLAN: r0=364(x), r1=163(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 163
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
