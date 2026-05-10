; DESCRIPTION: Draws a purple line from (57, 117) to (236, 74).
; PLAN: r0=57(x1), r1=117(y1), r2=236(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 117
LDI r2, 236
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
