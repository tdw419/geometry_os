; DESCRIPTION: Renders a orange disk with center (53, 148) and radius 40.
; PLAN: r0=53(x), r1=148(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 148
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
