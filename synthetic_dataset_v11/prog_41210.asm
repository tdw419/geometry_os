; DESCRIPTION: Draws a purple line from (63, 144) to (198, 135).
; PLAN: r0=63(x1), r1=144(y1), r2=198(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 144
LDI r2, 198
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
