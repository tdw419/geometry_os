; DESCRIPTION: Renders a orange disk with center (122, 215) and radius 17.
; PLAN: r0=122(x), r1=215(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 215
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
