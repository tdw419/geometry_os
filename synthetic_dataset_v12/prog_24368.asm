; DESCRIPTION: Renders a green disk with center (312, 175) and radius 79.
; PLAN: r0=312(x), r1=175(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 175
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
