; DESCRIPTION: Renders a yellow disk with center (237, 94) and radius 79.
; PLAN: r0=237(x), r1=94(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 94
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
