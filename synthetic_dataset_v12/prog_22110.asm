; DESCRIPTION: Renders a orange disk with center (380, 101) and radius 79.
; PLAN: r0=380(x), r1=101(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 101
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
