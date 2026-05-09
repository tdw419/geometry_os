; DESCRIPTION: Renders a black disk with center (113, 99) and radius 75.
; PLAN: r0=113(x), r1=99(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 99
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
