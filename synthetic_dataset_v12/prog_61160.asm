; DESCRIPTION: Renders a purple disk with center (392, 170) and radius 64.
; PLAN: r0=392(x), r1=170(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 170
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
