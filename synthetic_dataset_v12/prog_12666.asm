; DESCRIPTION: Renders a blue disk with center (392, 115) and radius 54.
; PLAN: r0=392(x), r1=115(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 115
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
