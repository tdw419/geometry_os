; DESCRIPTION: Renders a green disk with center (170, 165) and radius 79.
; PLAN: r0=170(x), r1=165(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 165
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
