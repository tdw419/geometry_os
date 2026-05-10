; DESCRIPTION: Renders a green circular shape at (118, 125) with radius 55.
; PLAN: r0=118(x), r1=125(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 125
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
