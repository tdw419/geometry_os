; DESCRIPTION: Renders a blue disk with center (117, 176) and radius 65.
; PLAN: r0=117(x), r1=176(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 176
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
