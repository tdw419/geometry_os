; DESCRIPTION: Draws a purple line from (438, 50) to (1, 99).
; PLAN: r0=438(x1), r1=50(y1), r2=1(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 50
LDI r2, 1
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
