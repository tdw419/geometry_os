; DESCRIPTION: Places a yellow circle of radius 66 at center (155, 127).
; PLAN: r0=155(x), r1=127(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 127
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
