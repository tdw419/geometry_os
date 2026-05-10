; DESCRIPTION: Renders a orange disk with center (310, 67) and radius 65.
; PLAN: r0=310(x), r1=67(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 67
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
