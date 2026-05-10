; DESCRIPTION: Draws a purple line from (344, 63) to (46, 180).
; PLAN: r0=344(x1), r1=63(y1), r2=46(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 63
LDI r2, 46
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
