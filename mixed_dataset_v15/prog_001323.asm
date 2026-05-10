; DESCRIPTION: Renders a purple disk with center (430, 166) and radius 48.
; PLAN: r0=430(x), r1=166(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 166
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
