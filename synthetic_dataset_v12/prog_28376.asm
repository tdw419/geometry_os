; DESCRIPTION: Renders a purple disk with center (438, 116) and radius 69.
; PLAN: r0=438(x), r1=116(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 116
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
