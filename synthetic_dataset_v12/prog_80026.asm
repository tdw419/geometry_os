; DESCRIPTION: Draws a orange line from (412, 77) to (315, 161).
; PLAN: r0=412(x1), r1=77(y1), r2=315(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 77
LDI r2, 315
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
