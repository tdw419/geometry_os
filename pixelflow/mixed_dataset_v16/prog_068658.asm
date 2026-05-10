; DESCRIPTION: Draws a red line from (78, 73) to (312, 63).
; PLAN: r0=78(x1), r1=73(y1), r2=312(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 73
LDI r2, 312
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
