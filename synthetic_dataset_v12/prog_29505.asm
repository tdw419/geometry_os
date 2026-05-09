; DESCRIPTION: Draws a red line from (80, 52) to (461, 68).
; PLAN: r0=80(x1), r1=52(y1), r2=461(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 52
LDI r2, 461
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
