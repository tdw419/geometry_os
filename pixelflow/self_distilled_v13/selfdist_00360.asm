; DESCRIPTION: Renders a green circular shape at (309, 12) with radius 17.
; PLAN: r0=309(x), r1=12(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 12
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
