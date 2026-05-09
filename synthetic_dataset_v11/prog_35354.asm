; DESCRIPTION: Draws a orange line from (86, 65) to (182, 248).
; PLAN: r0=86(x1), r1=65(y1), r2=182(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 65
LDI r2, 182
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
