; DESCRIPTION: Draws a orange line from (408, 16) to (216, 63).
; PLAN: r0=408(x1), r1=16(y1), r2=216(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 16
LDI r2, 216
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
