; DESCRIPTION: Draws a yellow line from (118, 110) to (108, 34).
; PLAN: r0=118(x1), r1=110(y1), r2=108(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 110
LDI r2, 108
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
