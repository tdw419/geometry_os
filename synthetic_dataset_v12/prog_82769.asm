; DESCRIPTION: Draws a red line from (31, 14) to (221, 61).
; PLAN: r0=31(x1), r1=14(y1), r2=221(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 14
LDI r2, 221
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
