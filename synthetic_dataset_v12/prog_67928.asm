; DESCRIPTION: Renders a purple disk with center (263, 108) and radius 78.
; PLAN: r0=263(x), r1=108(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 108
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
