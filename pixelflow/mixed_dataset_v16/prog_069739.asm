; DESCRIPTION: Renders a purple disk with center (149, 154) and radius 56.
; PLAN: r0=149(x), r1=154(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 154
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
