; DESCRIPTION: Renders a purple disk with center (179, 166) and radius 76.
; PLAN: r0=179(x), r1=166(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 166
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
