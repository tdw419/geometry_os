; DESCRIPTION: Renders a green circular shape at (221, 12) with radius 55.
; PLAN: r0=221(x), r1=12(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 12
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
