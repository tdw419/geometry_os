; DESCRIPTION: Draws a orange line from (395, 120) to (99, 38).
; PLAN: r0=395(x1), r1=120(y1), r2=99(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 120
LDI r2, 99
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
