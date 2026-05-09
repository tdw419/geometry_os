; DESCRIPTION: Draws a red line from (344, 140) to (385, 21).
; PLAN: r0=344(x1), r1=140(y1), r2=385(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 140
LDI r2, 385
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
