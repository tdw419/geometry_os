; DESCRIPTION: Draws a red line from (486, 96) to (467, 116).
; PLAN: r0=486(x1), r1=96(y1), r2=467(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 96
LDI r2, 467
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
