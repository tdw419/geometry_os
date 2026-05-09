; DESCRIPTION: Places a blue circle of radius 13 at center (156, 202).
; PLAN: r0=156(x), r1=202(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 202
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
