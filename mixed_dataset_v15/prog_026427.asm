; DESCRIPTION: Draws a red line from (78, 14) to (181, 236).
; PLAN: r0=78(x1), r1=14(y1), r2=181(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 14
LDI r2, 181
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
