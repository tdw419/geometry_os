; DESCRIPTION: Renders a green circular shape at (16, 163) with radius 55.
; PLAN: r0=16(x), r1=163(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 163
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
