; DESCRIPTION: Draws a red line from (348, 236) to (337, 162).
; PLAN: r0=348(x1), r1=236(y1), r2=337(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 236
LDI r2, 337
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
