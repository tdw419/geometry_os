; DESCRIPTION: Places a blue circle of radius 37 at center (338, 59).
; PLAN: r0=338(x), r1=59(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 59
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
