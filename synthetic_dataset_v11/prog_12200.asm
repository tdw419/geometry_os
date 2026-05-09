; DESCRIPTION: Renders a orange disk with center (40, 67) and radius 19.
; PLAN: r0=40(x), r1=67(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 67
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
