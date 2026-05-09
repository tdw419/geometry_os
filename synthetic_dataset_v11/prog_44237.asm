; DESCRIPTION: Renders a blue disk with center (54, 149) and radius 54.
; PLAN: r0=54(x), r1=149(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 149
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
