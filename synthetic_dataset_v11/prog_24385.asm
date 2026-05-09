; DESCRIPTION: Places a blue circle of radius 71 at center (119, 173).
; PLAN: r0=119(x), r1=173(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 173
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
