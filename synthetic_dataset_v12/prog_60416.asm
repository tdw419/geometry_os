; DESCRIPTION: Draws a red line from (15, 133) to (325, 72).
; PLAN: r0=15(x1), r1=133(y1), r2=325(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 133
LDI r2, 325
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
