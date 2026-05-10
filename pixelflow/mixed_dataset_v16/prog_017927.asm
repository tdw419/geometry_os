; DESCRIPTION: Places a blue circle of radius 74 at center (362, 79).
; PLAN: r0=362(x), r1=79(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 79
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
