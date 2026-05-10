; DESCRIPTION: Renders a orange circular shape at (166, 116) with radius 16.
; PLAN: r0=166(x), r1=116(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 116
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
