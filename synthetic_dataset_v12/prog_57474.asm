; DESCRIPTION: Renders a purple disk with center (420, 94) and radius 42.
; PLAN: r0=420(x), r1=94(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 94
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
