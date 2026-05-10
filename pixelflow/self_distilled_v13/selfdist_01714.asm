; DESCRIPTION: Renders a green circular shape at (225, 44) with radius 79.
; PLAN: r0=225(x), r1=44(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 44
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
