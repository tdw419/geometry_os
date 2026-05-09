; DESCRIPTION: Renders a blue disk with center (206, 127) and radius 47.
; PLAN: r0=206(x), r1=127(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 127
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
