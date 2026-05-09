; DESCRIPTION: Draws a blue line from (220, 89) to (438, 75).
; PLAN: r0=220(x1), r1=89(y1), r2=438(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 89
LDI r2, 438
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
