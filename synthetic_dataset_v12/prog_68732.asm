; DESCRIPTION: Draws a red line from (233, 7) to (468, 137).
; PLAN: r0=233(x1), r1=7(y1), r2=468(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 7
LDI r2, 468
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
