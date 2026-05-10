; DESCRIPTION: Renders a green circular shape at (142, 64) with radius 10.
; PLAN: r0=142(x), r1=64(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 64
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
