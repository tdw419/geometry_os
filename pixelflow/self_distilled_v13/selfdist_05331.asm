; DESCRIPTION: Renders a orange circular shape at (371, 117) with radius 10.
; PLAN: r0=371(x), r1=117(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 117
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
