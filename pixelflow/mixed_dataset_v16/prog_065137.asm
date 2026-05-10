; DESCRIPTION: Draws a orange line from (254, 67) to (72, 35).
; PLAN: r0=254(x1), r1=67(y1), r2=72(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 67
LDI r2, 72
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
