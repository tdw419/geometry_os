; DESCRIPTION: Draws a orange line from (391, 143) to (379, 98).
; PLAN: r0=391(x1), r1=143(y1), r2=379(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 143
LDI r2, 379
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
