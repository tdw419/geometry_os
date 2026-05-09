; DESCRIPTION: Draws a orange line from (7, 74) to (7, 70).
; PLAN: r0=7(x1), r1=74(y1), r2=7(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 74
LDI r2, 7
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
