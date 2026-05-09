; DESCRIPTION: Places a blue circle of radius 71 at center (95, 130).
; PLAN: r0=95(x), r1=130(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 130
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
