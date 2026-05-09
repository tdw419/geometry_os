; DESCRIPTION: Renders a orange disk with center (117, 101) and radius 56.
; PLAN: r0=117(x), r1=101(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 101
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
