; DESCRIPTION: Places a blue circle of radius 71 at center (130, 149).
; PLAN: r0=130(x), r1=149(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 149
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
