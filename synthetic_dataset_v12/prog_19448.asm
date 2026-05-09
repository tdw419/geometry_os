; DESCRIPTION: Renders a purple disk with center (212, 69) and radius 12.
; PLAN: r0=212(x), r1=69(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 69
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
