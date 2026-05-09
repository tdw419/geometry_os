; DESCRIPTION: Renders a blue disk with center (107, 207) and radius 45.
; PLAN: r0=107(x), r1=207(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 207
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
