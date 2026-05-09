; DESCRIPTION: Draws a yellow line from (470, 119) to (232, 158).
; PLAN: r0=470(x1), r1=119(y1), r2=232(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 119
LDI r2, 232
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
