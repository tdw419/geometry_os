; DESCRIPTION: Renders a purple disk with center (315, 166) and radius 14.
; PLAN: r0=315(x), r1=166(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 166
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
