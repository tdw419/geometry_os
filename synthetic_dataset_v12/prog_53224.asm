; DESCRIPTION: Draws a blue line from (411, 229) to (366, 46).
; PLAN: r0=411(x1), r1=229(y1), r2=366(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 229
LDI r2, 366
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
