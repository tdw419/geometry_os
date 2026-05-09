; DESCRIPTION: Draws a red line from (261, 147) to (70, 170).
; PLAN: r0=261(x1), r1=147(y1), r2=70(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 147
LDI r2, 70
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
