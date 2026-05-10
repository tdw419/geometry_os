; DESCRIPTION: Draws a orange line from (424, 212) to (150, 191).
; PLAN: r0=424(x1), r1=212(y1), r2=150(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 212
LDI r2, 150
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
