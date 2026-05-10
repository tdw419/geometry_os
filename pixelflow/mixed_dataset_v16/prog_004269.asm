; DESCRIPTION: Draws a purple line from (130, 118) to (251, 125).
; PLAN: r0=130(x1), r1=118(y1), r2=251(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 118
LDI r2, 251
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
