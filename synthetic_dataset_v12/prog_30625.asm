; DESCRIPTION: Renders a purple disk with center (302, 44) and radius 30.
; PLAN: r0=302(x), r1=44(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 44
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
