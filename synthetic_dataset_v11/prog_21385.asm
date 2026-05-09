; DESCRIPTION: Draws a red line from (164, 198) to (79, 217).
; PLAN: r0=164(x1), r1=198(y1), r2=79(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 198
LDI r2, 79
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
