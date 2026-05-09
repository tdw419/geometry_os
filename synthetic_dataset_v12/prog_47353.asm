; DESCRIPTION: Renders a blue disk with center (118, 72) and radius 68.
; PLAN: r0=118(x), r1=72(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 72
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
