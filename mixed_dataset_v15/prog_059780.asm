; DESCRIPTION: Draws a green line from (278, 174) to (323, 85).
; PLAN: r0=278(x1), r1=174(y1), r2=323(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 174
LDI r2, 323
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
