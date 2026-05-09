; DESCRIPTION: Draws a orange line from (296, 63) to (194, 44).
; PLAN: r0=296(x1), r1=63(y1), r2=194(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 63
LDI r2, 194
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
