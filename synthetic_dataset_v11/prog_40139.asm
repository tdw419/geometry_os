; DESCRIPTION: Draws a orange line from (71, 247) to (62, 74).
; PLAN: r0=71(x1), r1=247(y1), r2=62(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 247
LDI r2, 62
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
