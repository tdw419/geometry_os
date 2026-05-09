; DESCRIPTION: Renders a blue disk with center (96, 65) and radius 58.
; PLAN: r0=96(x), r1=65(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 65
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
