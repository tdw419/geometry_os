; DESCRIPTION: Renders a green circular shape at (130, 126) with radius 18.
; PLAN: r0=130(x), r1=126(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 126
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
