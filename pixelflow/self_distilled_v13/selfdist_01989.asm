; DESCRIPTION: Renders a green circular shape at (165, 123) with radius 59.
; PLAN: r0=165(x), r1=123(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 123
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
