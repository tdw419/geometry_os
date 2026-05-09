; DESCRIPTION: Draws a orange line from (54, 40) to (33, 179).
; PLAN: r0=54(x1), r1=40(y1), r2=33(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 40
LDI r2, 33
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
