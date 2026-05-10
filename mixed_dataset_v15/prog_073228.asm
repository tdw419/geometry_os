; DESCRIPTION: Draws a orange line from (20, 25) to (72, 112).
; PLAN: r0=20(x1), r1=25(y1), r2=72(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 25
LDI r2, 72
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
