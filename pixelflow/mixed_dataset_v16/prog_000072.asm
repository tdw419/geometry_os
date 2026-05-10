; DESCRIPTION: Draws a orange line from (335, 197) to (95, 37).
; PLAN: r0=335(x1), r1=197(y1), r2=95(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 197
LDI r2, 95
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
