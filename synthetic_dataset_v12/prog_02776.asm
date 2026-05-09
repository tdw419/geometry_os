; DESCRIPTION: Draws a purple line from (27, 118) to (60, 214).
; PLAN: r0=27(x1), r1=118(y1), r2=60(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 118
LDI r2, 60
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
