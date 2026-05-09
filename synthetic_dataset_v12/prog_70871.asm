; DESCRIPTION: Places a blue line segment connecting (448, 197) to (425, 211).
; PLAN: r0=448(x1), r1=197(y1), r2=425(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 197
LDI r2, 425
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
