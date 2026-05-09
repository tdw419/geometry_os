; DESCRIPTION: Draws a purple line from (16, 231) to (125, 230).
; PLAN: r0=16(x1), r1=231(y1), r2=125(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 231
LDI r2, 125
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
