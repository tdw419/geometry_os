; DESCRIPTION: Renders a green circular shape at (240, 193) with radius 68.
; PLAN: r0=240(x), r1=193(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 193
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
