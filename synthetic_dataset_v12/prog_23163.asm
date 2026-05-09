; DESCRIPTION: Draws a orange line from (214, 21) to (214, 90).
; PLAN: r0=214(x1), r1=21(y1), r2=214(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 21
LDI r2, 214
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
