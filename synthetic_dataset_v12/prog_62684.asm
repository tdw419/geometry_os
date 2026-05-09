; DESCRIPTION: Draws a orange line from (85, 120) to (395, 252).
; PLAN: r0=85(x1), r1=120(y1), r2=395(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 120
LDI r2, 395
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
