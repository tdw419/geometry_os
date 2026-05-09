; DESCRIPTION: Renders a purple line between points (196, 187) and (448, 159).
; PLAN: r0=196(x1), r1=187(y1), r2=448(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 187
LDI r2, 448
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
