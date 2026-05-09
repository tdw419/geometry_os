; DESCRIPTION: Renders a blue disk with center (365, 76) and radius 58.
; PLAN: r0=365(x), r1=76(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 76
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
