; DESCRIPTION: Places a blue circle of radius 11 at center (130, 30).
; PLAN: r0=130(x), r1=30(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 30
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
