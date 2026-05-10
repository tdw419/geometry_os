; DESCRIPTION: Renders a green circular shape at (196, 195) with radius 55.
; PLAN: r0=196(x), r1=195(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 195
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
