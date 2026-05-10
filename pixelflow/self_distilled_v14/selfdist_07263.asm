; DESCRIPTION: Renders a orange circular shape at (162, 198) with radius 63.
; PLAN: r0=162(x), r1=198(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 198
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
