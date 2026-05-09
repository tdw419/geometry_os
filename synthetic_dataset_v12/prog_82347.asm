; DESCRIPTION: Renders a red line between points (145, 31) and (301, 9).
; PLAN: r0=145(x1), r1=31(y1), r2=301(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 31
LDI r2, 301
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
