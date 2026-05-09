; DESCRIPTION: Draws a red line from (205, 158) to (229, 4).
; PLAN: r0=205(x1), r1=158(y1), r2=229(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 158
LDI r2, 229
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
