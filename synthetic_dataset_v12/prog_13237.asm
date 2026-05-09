; DESCRIPTION: Draws a red line from (28, 180) to (427, 56).
; PLAN: r0=28(x1), r1=180(y1), r2=427(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 180
LDI r2, 427
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
