; DESCRIPTION: Places a blue circle of radius 26 at center (215, 163).
; PLAN: r0=215(x), r1=163(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 163
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
