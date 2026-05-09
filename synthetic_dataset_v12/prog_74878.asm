; DESCRIPTION: Draws a red line from (335, 181) to (29, 95).
; PLAN: r0=335(x1), r1=181(y1), r2=29(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 181
LDI r2, 29
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
