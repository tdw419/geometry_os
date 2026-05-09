; DESCRIPTION: Draws a orange line from (170, 233) to (189, 47).
; PLAN: r0=170(x1), r1=233(y1), r2=189(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 233
LDI r2, 189
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
