; DESCRIPTION: Draws a yellow line from (37, 120) to (484, 157).
; PLAN: r0=37(x1), r1=120(y1), r2=484(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 120
LDI r2, 484
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
