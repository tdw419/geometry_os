; DESCRIPTION: Renders a orange circular shape at (45, 110) with radius 23.
; PLAN: r0=45(x), r1=110(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 110
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
