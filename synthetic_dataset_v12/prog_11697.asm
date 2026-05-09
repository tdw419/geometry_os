; DESCRIPTION: Draws a orange line from (61, 60) to (339, 65).
; PLAN: r0=61(x1), r1=60(y1), r2=339(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 60
LDI r2, 339
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
