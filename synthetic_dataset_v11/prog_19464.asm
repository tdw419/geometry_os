; DESCRIPTION: Draws a orange line from (132, 174) to (74, 117).
; PLAN: r0=132(x1), r1=174(y1), r2=74(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 174
LDI r2, 74
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
