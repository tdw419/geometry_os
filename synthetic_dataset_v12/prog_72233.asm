; DESCRIPTION: Draws a magenta line from (390, 144) to (8, 198).
; PLAN: r0=390(x1), r1=144(y1), r2=8(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 144
LDI r2, 8
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
