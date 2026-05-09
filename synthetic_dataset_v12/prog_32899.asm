; DESCRIPTION: Renders a orange disk with center (389, 153) and radius 66.
; PLAN: r0=389(x), r1=153(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 153
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
