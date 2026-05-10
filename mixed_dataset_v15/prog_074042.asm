; DESCRIPTION: Draws a orange line from (84, 252) to (214, 247).
; PLAN: r0=84(x1), r1=252(y1), r2=214(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 252
LDI r2, 214
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
