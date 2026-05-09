; DESCRIPTION: Draws a orange line from (90, 131) to (40, 70).
; PLAN: r0=90(x1), r1=131(y1), r2=40(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 131
LDI r2, 40
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
