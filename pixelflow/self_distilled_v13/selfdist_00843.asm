; DESCRIPTION: Draws a red line from (188, 21) to (391, 105).
; PLAN: r0=188(x1), r1=21(y1), r2=391(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 21
LDI r2, 391
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
