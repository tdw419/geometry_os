; DESCRIPTION: Draws a black line from (174, 80) to (314, 54).
; PLAN: r0=174(x1), r1=80(y1), r2=314(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 80
LDI r2, 314
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
