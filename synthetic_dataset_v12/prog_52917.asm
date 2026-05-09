; DESCRIPTION: Draws a orange line from (41, 200) to (56, 239).
; PLAN: r0=41(x1), r1=200(y1), r2=56(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 200
LDI r2, 56
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
