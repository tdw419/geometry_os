; DESCRIPTION: Places a green line segment connecting (399, 199) to (448, 251).
; PLAN: r0=399(x1), r1=199(y1), r2=448(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 199
LDI r2, 448
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
