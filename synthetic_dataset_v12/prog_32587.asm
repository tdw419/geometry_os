; DESCRIPTION: Draws a purple line from (366, 233) to (212, 28).
; PLAN: r0=366(x1), r1=233(y1), r2=212(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 233
LDI r2, 212
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
