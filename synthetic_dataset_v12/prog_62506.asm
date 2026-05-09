; DESCRIPTION: Draws a red line from (24, 153) to (452, 77).
; PLAN: r0=24(x1), r1=153(y1), r2=452(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 153
LDI r2, 452
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
