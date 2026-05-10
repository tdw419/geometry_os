; DESCRIPTION: Draws a blue line from (22, 9) to (231, 233).
; PLAN: r0=22(x1), r1=9(y1), r2=231(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 9
LDI r2, 231
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
