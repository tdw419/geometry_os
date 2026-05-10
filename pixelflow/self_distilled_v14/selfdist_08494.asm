; DESCRIPTION: Renders a orange circular shape at (189, 0) with radius 69.
; PLAN: r0=189(x), r1=0(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 0
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
