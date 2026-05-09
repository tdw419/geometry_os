; DESCRIPTION: Renders a purple disk with center (85, 154) and radius 62.
; PLAN: r0=85(x), r1=154(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 154
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
