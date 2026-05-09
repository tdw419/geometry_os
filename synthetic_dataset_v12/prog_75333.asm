; DESCRIPTION: Draws a blue line from (91, 169) to (98, 207).
; PLAN: r0=91(x1), r1=169(y1), r2=98(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 169
LDI r2, 98
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
