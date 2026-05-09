; DESCRIPTION: Renders a blue disk with center (243, 123) and radius 79.
; PLAN: r0=243(x), r1=123(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 123
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
