; DESCRIPTION: Renders a orange circular shape at (72, 153) with radius 39.
; PLAN: r0=72(x), r1=153(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 153
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
