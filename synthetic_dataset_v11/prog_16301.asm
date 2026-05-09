; DESCRIPTION: Renders a orange disk with center (104, 224) and radius 25.
; PLAN: r0=104(x), r1=224(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 224
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
