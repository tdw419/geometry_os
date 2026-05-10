; DESCRIPTION: Renders a purple disk with center (101, 154) and radius 70.
; PLAN: r0=101(x), r1=154(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 154
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
