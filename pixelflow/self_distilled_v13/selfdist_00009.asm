; DESCRIPTION: Renders a orange circular shape at (327, 55) with radius 69.
; PLAN: r0=327(x), r1=55(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 55
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
