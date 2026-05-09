; DESCRIPTION: Draws a black line from (428, 132) to (314, 133).
; PLAN: r0=428(x1), r1=132(y1), r2=314(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 132
LDI r2, 314
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
