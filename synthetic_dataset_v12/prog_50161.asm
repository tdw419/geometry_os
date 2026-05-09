; DESCRIPTION: Renders a orange disk with center (212, 101) and radius 55.
; PLAN: r0=212(x), r1=101(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 101
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
