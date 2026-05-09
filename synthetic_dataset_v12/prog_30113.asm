; DESCRIPTION: Draws a orange line from (5, 162) to (72, 176).
; PLAN: r0=5(x1), r1=162(y1), r2=72(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 162
LDI r2, 72
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
