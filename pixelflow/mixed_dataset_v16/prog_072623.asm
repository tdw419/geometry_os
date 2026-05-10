; DESCRIPTION: Renders a orange circular shape at (188, 138) with radius 11.
; PLAN: r0=188(x), r1=138(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 138
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
