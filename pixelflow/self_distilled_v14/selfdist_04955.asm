; DESCRIPTION: Renders a orange circular shape at (47, 63) with radius 25.
; PLAN: r0=47(x), r1=63(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 63
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
