; DESCRIPTION: Renders a purple disk with center (397, 94) and radius 78.
; PLAN: r0=397(x), r1=94(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 94
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
