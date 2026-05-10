; DESCRIPTION: Renders a green circular shape at (324, 114) with radius 56.
; PLAN: r0=324(x), r1=114(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 114
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
