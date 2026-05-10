; DESCRIPTION: Renders a blue circular shape at (103, 89) with radius 13.
; PLAN: r0=103(x), r1=89(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 89
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
