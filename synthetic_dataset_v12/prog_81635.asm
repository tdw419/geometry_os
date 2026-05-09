; DESCRIPTION: Draws a green line from (88, 119) to (427, 150).
; PLAN: r0=88(x1), r1=119(y1), r2=427(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 119
LDI r2, 427
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
