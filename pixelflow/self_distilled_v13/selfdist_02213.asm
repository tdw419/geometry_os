; DESCRIPTION: Renders a orange circular shape at (45, 138) with radius 52.
; PLAN: r0=45(x), r1=138(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 138
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
