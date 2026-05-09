; DESCRIPTION: Draws a orange line from (470, 102) to (30, 2).
; PLAN: r0=470(x1), r1=102(y1), r2=30(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 102
LDI r2, 30
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
