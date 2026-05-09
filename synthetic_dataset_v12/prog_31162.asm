; DESCRIPTION: Draws a red line from (97, 95) to (349, 240).
; PLAN: r0=97(x1), r1=95(y1), r2=349(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 95
LDI r2, 349
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
