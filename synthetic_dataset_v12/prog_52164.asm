; DESCRIPTION: Renders a blue disk with center (190, 178) and radius 69.
; PLAN: r0=190(x), r1=178(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 178
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
