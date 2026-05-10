; DESCRIPTION: Renders a purple circular shape at (250, 108) with radius 28.
; PLAN: r0=250(x), r1=108(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 108
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
