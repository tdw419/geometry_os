; DESCRIPTION: Renders a purple disk with center (189, 69) and radius 67.
; PLAN: r0=189(x), r1=69(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 69
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
