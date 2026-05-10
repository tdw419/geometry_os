; DESCRIPTION: Draws a orange line from (395, 5) to (261, 120).
; PLAN: r0=395(x1), r1=5(y1), r2=261(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 5
LDI r2, 261
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
