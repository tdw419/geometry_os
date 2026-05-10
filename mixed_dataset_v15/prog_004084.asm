; DESCRIPTION: Renders a green circular shape at (345, 9) with radius 53.
; PLAN: r0=345(x), r1=9(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 9
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
