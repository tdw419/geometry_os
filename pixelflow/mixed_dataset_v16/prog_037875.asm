; DESCRIPTION: Draws a purple line from (206, 118) to (265, 109).
; PLAN: r0=206(x1), r1=118(y1), r2=265(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 118
LDI r2, 265
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
