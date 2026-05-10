; DESCRIPTION: Renders a orange circular shape at (330, 135) with radius 69.
; PLAN: r0=330(x), r1=135(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 135
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
