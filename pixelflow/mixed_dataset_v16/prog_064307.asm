; DESCRIPTION: Renders a orange disk with center (294, 104) and radius 72.
; PLAN: r0=294(x), r1=104(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 104
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
