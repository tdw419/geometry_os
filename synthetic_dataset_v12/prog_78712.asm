; DESCRIPTION: Renders a orange disk with center (191, 160) and radius 69.
; PLAN: r0=191(x), r1=160(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 160
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
