; DESCRIPTION: Renders a orange circular shape at (176, 52) with radius 45.
; PLAN: r0=176(x), r1=52(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 52
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
