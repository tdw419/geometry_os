; DESCRIPTION: Renders a blue disk with center (440, 187) and radius 62.
; PLAN: r0=440(x), r1=187(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 187
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
