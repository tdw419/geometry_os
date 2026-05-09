; DESCRIPTION: Renders a blue disk with center (108, 109) and radius 65.
; PLAN: r0=108(x), r1=109(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 109
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
