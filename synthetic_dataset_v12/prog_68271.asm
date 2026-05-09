; DESCRIPTION: Draws a red line from (110, 64) to (501, 31).
; PLAN: r0=110(x1), r1=64(y1), r2=501(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 64
LDI r2, 501
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
