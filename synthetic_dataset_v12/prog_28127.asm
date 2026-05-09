; DESCRIPTION: Draws a red line from (238, 36) to (491, 75).
; PLAN: r0=238(x1), r1=36(y1), r2=491(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 36
LDI r2, 491
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
