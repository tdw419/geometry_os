; DESCRIPTION: Places a blue circle of radius 72 at center (202, 97).
; PLAN: r0=202(x), r1=97(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 97
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
