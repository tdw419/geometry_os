; DESCRIPTION: Draws a orange line from (411, 76) to (376, 231).
; PLAN: r0=411(x1), r1=76(y1), r2=376(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 76
LDI r2, 376
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
