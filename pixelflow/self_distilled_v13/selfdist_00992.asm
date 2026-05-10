; DESCRIPTION: Renders a green circular shape at (366, 58) with radius 75.
; PLAN: r0=366(x), r1=58(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 58
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
