; DESCRIPTION: Draws a red line from (172, 34) to (383, 49).
; PLAN: r0=172(x1), r1=34(y1), r2=383(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 34
LDI r2, 383
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
