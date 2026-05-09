; DESCRIPTION: Draws a red line from (10, 188) to (182, 251).
; PLAN: r0=10(x1), r1=188(y1), r2=182(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 188
LDI r2, 182
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
