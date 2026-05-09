; DESCRIPTION: Draws a purple line from (196, 8) to (37, 251).
; PLAN: r0=196(x1), r1=8(y1), r2=37(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 8
LDI r2, 37
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
