; DESCRIPTION: Draws a red line from (34, 85) to (241, 168).
; PLAN: r0=34(x1), r1=85(y1), r2=241(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 85
LDI r2, 241
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
