; DESCRIPTION: Renders a blue disk with center (76, 180) and radius 56.
; PLAN: r0=76(x), r1=180(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 180
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
