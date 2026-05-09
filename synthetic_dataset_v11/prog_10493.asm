; DESCRIPTION: Draws a purple line from (7, 134) to (128, 233).
; PLAN: r0=7(x1), r1=134(y1), r2=128(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 134
LDI r2, 128
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
