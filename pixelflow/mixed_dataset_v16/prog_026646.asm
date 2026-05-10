; DESCRIPTION: Draws a red line from (176, 34) to (457, 10).
; PLAN: r0=176(x1), r1=34(y1), r2=457(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 34
LDI r2, 457
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
