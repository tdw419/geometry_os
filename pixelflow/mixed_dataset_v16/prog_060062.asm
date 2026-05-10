; DESCRIPTION: Renders a orange circular shape at (149, 98) with radius 17.
; PLAN: r0=149(x), r1=98(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 98
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
