; DESCRIPTION: Renders a blue disk with center (220, 56) and radius 16.
; PLAN: r0=220(x), r1=56(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 56
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
