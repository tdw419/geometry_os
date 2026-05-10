; DESCRIPTION: Renders a orange disk with center (246, 128) and radius 69.
; PLAN: r0=246(x), r1=128(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 128
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
