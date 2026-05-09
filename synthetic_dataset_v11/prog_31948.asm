; DESCRIPTION: Draws a orange line from (107, 1) to (61, 88).
; PLAN: r0=107(x1), r1=1(y1), r2=61(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 1
LDI r2, 61
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
