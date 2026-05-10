; DESCRIPTION: Renders a orange circular shape at (20, 53) with radius 55.
; PLAN: r0=20(x), r1=53(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 53
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
