; DESCRIPTION: Renders a purple disk with center (108, 192) and radius 36.
; PLAN: r0=108(x), r1=192(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 192
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
