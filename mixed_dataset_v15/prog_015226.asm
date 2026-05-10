; DESCRIPTION: Renders a blue circular shape at (102, 91) with radius 48.
; PLAN: r0=102(x), r1=91(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 91
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
