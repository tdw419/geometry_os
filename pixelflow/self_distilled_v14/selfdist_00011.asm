; DESCRIPTION: Renders a green circular shape at (50, 91) with radius 51.
; PLAN: r0=50(x), r1=91(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 91
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
