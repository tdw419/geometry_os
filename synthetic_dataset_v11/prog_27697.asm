; DESCRIPTION: Renders a blue disk with center (70, 126) and radius 49.
; PLAN: r0=70(x), r1=126(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 126
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
