; DESCRIPTION: Draws a red line from (106, 8) to (60, 34).
; PLAN: r0=106(x1), r1=8(y1), r2=60(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 8
LDI r2, 60
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
