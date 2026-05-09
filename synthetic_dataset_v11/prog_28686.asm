; DESCRIPTION: Places a blue circle of radius 25 at center (196, 49).
; PLAN: r0=196(x), r1=49(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 49
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
