; DESCRIPTION: Renders a blue disk with center (127, 120) and radius 29.
; PLAN: r0=127(x), r1=120(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 120
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
