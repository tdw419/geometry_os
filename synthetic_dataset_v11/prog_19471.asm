; DESCRIPTION: Draws a orange line from (185, 101) to (215, 77).
; PLAN: r0=185(x1), r1=101(y1), r2=215(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 101
LDI r2, 215
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
