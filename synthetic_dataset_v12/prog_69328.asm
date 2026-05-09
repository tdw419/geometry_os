; DESCRIPTION: Draws a red line from (266, 12) to (383, 37).
; PLAN: r0=266(x1), r1=12(y1), r2=383(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 12
LDI r2, 383
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
