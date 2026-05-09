; DESCRIPTION: Renders a green disk with center (424, 175) and radius 47.
; PLAN: r0=424(x), r1=175(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 175
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
