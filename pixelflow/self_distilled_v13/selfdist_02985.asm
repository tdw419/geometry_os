; DESCRIPTION: Draws a red line from (342, 181) to (236, 70).
; PLAN: r0=342(x1), r1=181(y1), r2=236(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 181
LDI r2, 236
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
