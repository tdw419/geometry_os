; DESCRIPTION: Renders a orange circular shape at (89, 143) with radius 35.
; PLAN: r0=89(x), r1=143(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 143
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
