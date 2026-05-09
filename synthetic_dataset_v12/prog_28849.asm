; DESCRIPTION: Draws a orange line from (377, 75) to (276, 207).
; PLAN: r0=377(x1), r1=75(y1), r2=276(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 75
LDI r2, 276
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
