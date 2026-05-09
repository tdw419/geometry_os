; DESCRIPTION: Renders a orange line between points (135, 218) and (301, 34).
; PLAN: r0=135(x1), r1=218(y1), r2=301(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 218
LDI r2, 301
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
