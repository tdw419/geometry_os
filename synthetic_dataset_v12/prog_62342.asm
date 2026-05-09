; DESCRIPTION: Renders a orange disk with center (59, 43) and radius 19.
; PLAN: r0=59(x), r1=43(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 43
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
