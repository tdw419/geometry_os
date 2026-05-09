; DESCRIPTION: Draws a orange line from (30, 150) to (5, 137).
; PLAN: r0=30(x1), r1=150(y1), r2=5(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 150
LDI r2, 5
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
