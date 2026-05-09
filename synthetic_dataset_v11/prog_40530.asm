; DESCRIPTION: Draws a blue line from (185, 93) to (231, 22).
; PLAN: r0=185(x1), r1=93(y1), r2=231(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 93
LDI r2, 231
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
