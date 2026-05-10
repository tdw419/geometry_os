; DESCRIPTION: Draws a purple line from (489, 160) to (220, 215).
; PLAN: r0=489(x1), r1=160(y1), r2=220(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 160
LDI r2, 220
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
