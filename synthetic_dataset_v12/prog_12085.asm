; DESCRIPTION: Renders a purple disk with center (397, 143) and radius 34.
; PLAN: r0=397(x), r1=143(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 143
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
