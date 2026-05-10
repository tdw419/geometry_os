; DESCRIPTION: Renders a blue disk with center (306, 116) and radius 45.
; PLAN: r0=306(x), r1=116(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 116
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
