; DESCRIPTION: Draws a purple line from (344, 68) to (490, 231).
; PLAN: r0=344(x1), r1=68(y1), r2=490(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 68
LDI r2, 490
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
