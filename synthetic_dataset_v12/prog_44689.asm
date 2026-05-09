; DESCRIPTION: Draws a orange line from (216, 13) to (82, 155).
; PLAN: r0=216(x1), r1=13(y1), r2=82(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 13
LDI r2, 82
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
