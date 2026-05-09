; DESCRIPTION: Renders a orange disk with center (385, 171) and radius 53.
; PLAN: r0=385(x), r1=171(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 171
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
