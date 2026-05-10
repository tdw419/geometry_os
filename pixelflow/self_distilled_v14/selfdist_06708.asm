; DESCRIPTION: Draws a orange line from (323, 195) to (191, 6).
; PLAN: r0=323(x1), r1=195(y1), r2=191(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 195
LDI r2, 191
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
