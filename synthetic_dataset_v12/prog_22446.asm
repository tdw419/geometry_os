; DESCRIPTION: Renders a blue disk with center (107, 127) and radius 79.
; PLAN: r0=107(x), r1=127(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 127
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
