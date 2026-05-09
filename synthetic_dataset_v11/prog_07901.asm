; DESCRIPTION: Renders a orange disk with center (102, 141) and radius 15.
; PLAN: r0=102(x), r1=141(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 141
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
