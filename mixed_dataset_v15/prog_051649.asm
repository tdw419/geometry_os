; DESCRIPTION: Renders a orange disk with center (102, 171) and radius 17.
; PLAN: r0=102(x), r1=171(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 171
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
