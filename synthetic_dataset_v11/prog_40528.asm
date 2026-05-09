; DESCRIPTION: Places a purple circle of radius 72 at center (84, 113).
; PLAN: r0=84(x), r1=113(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 113
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
