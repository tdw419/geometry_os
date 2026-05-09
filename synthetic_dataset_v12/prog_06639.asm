; DESCRIPTION: Renders a blue disk with center (424, 65) and radius 61.
; PLAN: r0=424(x), r1=65(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 65
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
