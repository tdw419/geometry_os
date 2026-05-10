; DESCRIPTION: Draws a blue line from (8, 187) to (323, 140).
; PLAN: r0=8(x1), r1=187(y1), r2=323(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 187
LDI r2, 323
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
