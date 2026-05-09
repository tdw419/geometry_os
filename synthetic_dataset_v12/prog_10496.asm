; DESCRIPTION: Draws a red line from (358, 95) to (492, 252).
; PLAN: r0=358(x1), r1=95(y1), r2=492(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 95
LDI r2, 492
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
