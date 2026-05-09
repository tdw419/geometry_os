; DESCRIPTION: Renders a blue disk with center (164, 79) and radius 62.
; PLAN: r0=164(x), r1=79(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 79
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
