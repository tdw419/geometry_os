; DESCRIPTION: Renders a purple disk with center (57, 62) and radius 32.
; PLAN: r0=57(x), r1=62(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 62
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
