; DESCRIPTION: Renders a purple disk with center (220, 68) and radius 13.
; PLAN: r0=220(x), r1=68(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 68
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
