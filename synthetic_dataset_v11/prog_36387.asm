; DESCRIPTION: Draws a orange line from (204, 9) to (7, 30).
; PLAN: r0=204(x1), r1=9(y1), r2=7(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 9
LDI r2, 7
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
