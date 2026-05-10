; DESCRIPTION: Draws a red line from (308, 167) to (250, 175).
; PLAN: r0=308(x1), r1=167(y1), r2=250(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 167
LDI r2, 250
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
