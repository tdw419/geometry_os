; DESCRIPTION: Places a blue circle of radius 50 at center (203, 136).
; PLAN: r0=203(x), r1=136(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 136
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
