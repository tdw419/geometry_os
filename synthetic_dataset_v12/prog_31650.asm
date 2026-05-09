; DESCRIPTION: Draws a orange line from (18, 70) to (22, 152).
; PLAN: r0=18(x1), r1=70(y1), r2=22(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 70
LDI r2, 22
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
