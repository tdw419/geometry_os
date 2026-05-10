; DESCRIPTION: Draws a red line from (135, 179) to (318, 87).
; PLAN: r0=135(x1), r1=179(y1), r2=318(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 179
LDI r2, 318
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
