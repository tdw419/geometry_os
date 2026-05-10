; DESCRIPTION: Renders a blue disk with center (215, 126) and radius 11.
; PLAN: r0=215(x), r1=126(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 126
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
