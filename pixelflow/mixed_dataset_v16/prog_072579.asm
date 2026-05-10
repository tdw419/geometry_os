; DESCRIPTION: Draws a green line from (78, 10) to (432, 34).
; PLAN: r0=78(x1), r1=10(y1), r2=432(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 10
LDI r2, 432
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
