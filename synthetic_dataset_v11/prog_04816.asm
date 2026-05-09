; DESCRIPTION: Renders a blue disk with center (102, 87) and radius 75.
; PLAN: r0=102(x), r1=87(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 87
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
