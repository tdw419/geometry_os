; DESCRIPTION: Renders a purple circular shape at (299, 90) with radius 34.
; PLAN: r0=299(x), r1=90(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 90
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
