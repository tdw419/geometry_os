; DESCRIPTION: Draws a orange line from (276, 193) to (221, 138).
; PLAN: r0=276(x1), r1=193(y1), r2=221(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 193
LDI r2, 221
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
