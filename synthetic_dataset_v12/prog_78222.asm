; DESCRIPTION: Draws a orange line from (318, 36) to (341, 168).
; PLAN: r0=318(x1), r1=36(y1), r2=341(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 36
LDI r2, 341
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
