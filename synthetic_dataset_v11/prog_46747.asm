; DESCRIPTION: Draws a red line from (15, 112) to (236, 5).
; PLAN: r0=15(x1), r1=112(y1), r2=236(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 112
LDI r2, 236
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
