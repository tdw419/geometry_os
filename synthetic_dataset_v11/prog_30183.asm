; DESCRIPTION: Places a blue circle of radius 44 at center (196, 188).
; PLAN: r0=196(x), r1=188(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 188
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
