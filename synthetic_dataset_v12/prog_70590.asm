; DESCRIPTION: Places a blue line segment connecting (197, 197) to (497, 99).
; PLAN: r0=197(x1), r1=197(y1), r2=497(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 197
LDI r2, 497
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
