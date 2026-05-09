; DESCRIPTION: Draws a orange line from (300, 121) to (36, 76).
; PLAN: r0=300(x1), r1=121(y1), r2=36(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 121
LDI r2, 36
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
