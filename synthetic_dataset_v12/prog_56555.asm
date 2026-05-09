; DESCRIPTION: Draws a red line from (317, 160) to (116, 136).
; PLAN: r0=317(x1), r1=160(y1), r2=116(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 160
LDI r2, 116
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
