; DESCRIPTION: Renders a blue disk with center (127, 168) and radius 79.
; PLAN: r0=127(x), r1=168(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 168
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
