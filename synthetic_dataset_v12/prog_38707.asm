; DESCRIPTION: Places a blue circle of radius 79 at center (195, 84).
; PLAN: r0=195(x), r1=84(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 84
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
