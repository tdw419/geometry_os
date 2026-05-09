; DESCRIPTION: Draws a orange line from (452, 50) to (207, 88).
; PLAN: r0=452(x1), r1=50(y1), r2=207(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 50
LDI r2, 207
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
