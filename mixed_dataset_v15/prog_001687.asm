; DESCRIPTION: Renders a purple disk with center (57, 86) and radius 23.
; PLAN: r0=57(x), r1=86(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 86
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
