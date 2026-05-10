; DESCRIPTION: Draws a orange line from (378, 13) to (43, 141).
; PLAN: r0=378(x1), r1=13(y1), r2=43(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 13
LDI r2, 43
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
