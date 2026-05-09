; DESCRIPTION: Draws a red line from (349, 208) to (162, 163).
; PLAN: r0=349(x1), r1=208(y1), r2=162(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 208
LDI r2, 162
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
