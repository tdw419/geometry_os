; DESCRIPTION: Draws a purple line from (412, 115) to (231, 98).
; PLAN: r0=412(x1), r1=115(y1), r2=231(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 115
LDI r2, 231
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
