; DESCRIPTION: Renders a orange circular shape at (367, 21) with radius 73.
; PLAN: r0=367(x), r1=21(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 21
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
