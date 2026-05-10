; DESCRIPTION: Renders a green circular shape at (389, 159) with radius 39.
; PLAN: r0=389(x), r1=159(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 159
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
