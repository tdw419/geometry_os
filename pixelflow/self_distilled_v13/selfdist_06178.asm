; DESCRIPTION: Renders a orange circular shape at (376, 137) with radius 40.
; PLAN: r0=376(x), r1=137(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 137
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
