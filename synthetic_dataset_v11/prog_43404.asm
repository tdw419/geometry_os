; DESCRIPTION: Draws a orange line from (236, 235) to (96, 246).
; PLAN: r0=236(x1), r1=235(y1), r2=96(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 235
LDI r2, 96
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
