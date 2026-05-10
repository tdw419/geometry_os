; DESCRIPTION: Renders a orange circular shape at (149, 91) with radius 32.
; PLAN: r0=149(x), r1=91(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 91
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
