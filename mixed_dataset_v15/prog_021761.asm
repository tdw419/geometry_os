; DESCRIPTION: Draws a orange line from (104, 22) to (214, 149).
; PLAN: r0=104(x1), r1=22(y1), r2=214(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 22
LDI r2, 214
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
