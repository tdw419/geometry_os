; DESCRIPTION: Renders a orange disk with center (316, 215) and radius 23.
; PLAN: r0=316(x), r1=215(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 215
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
