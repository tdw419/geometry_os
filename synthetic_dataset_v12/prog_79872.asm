; DESCRIPTION: Renders a purple disk with center (300, 120) and radius 62.
; PLAN: r0=300(x), r1=120(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 120
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
