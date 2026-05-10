; DESCRIPTION: Renders a green circular shape at (27, 63) with radius 15.
; PLAN: r0=27(x), r1=63(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 63
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
