; DESCRIPTION: Draws a orange line from (4, 69) to (35, 52).
; PLAN: r0=4(x1), r1=69(y1), r2=35(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 69
LDI r2, 35
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
