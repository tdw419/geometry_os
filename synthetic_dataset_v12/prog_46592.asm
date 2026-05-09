; DESCRIPTION: Draws a purple line from (33, 99) to (448, 134).
; PLAN: r0=33(x1), r1=99(y1), r2=448(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 99
LDI r2, 448
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
