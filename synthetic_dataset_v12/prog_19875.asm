; DESCRIPTION: Draws a orange line from (163, 86) to (339, 143).
; PLAN: r0=163(x1), r1=86(y1), r2=339(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 86
LDI r2, 339
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
