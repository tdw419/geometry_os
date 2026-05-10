; DESCRIPTION: Renders a orange circular shape at (302, 174) with radius 73.
; PLAN: r0=302(x), r1=174(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 174
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
