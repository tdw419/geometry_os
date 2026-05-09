; DESCRIPTION: Renders a purple disk with center (143, 171) and radius 69.
; PLAN: r0=143(x), r1=171(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 171
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
