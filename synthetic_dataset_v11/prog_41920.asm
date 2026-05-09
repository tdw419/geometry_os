; DESCRIPTION: Draws a orange line from (113, 63) to (141, 145).
; PLAN: r0=113(x1), r1=63(y1), r2=141(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 63
LDI r2, 141
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
