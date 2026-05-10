; DESCRIPTION: Draws a orange line from (423, 115) to (138, 198).
; PLAN: r0=423(x1), r1=115(y1), r2=138(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 115
LDI r2, 138
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
