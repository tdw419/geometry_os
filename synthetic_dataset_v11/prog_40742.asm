; DESCRIPTION: Places a blue circle of radius 50 at center (136, 73).
; PLAN: r0=136(x), r1=73(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 73
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
