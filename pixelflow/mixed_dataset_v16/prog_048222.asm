; DESCRIPTION: Draws a orange line from (184, 63) to (251, 46).
; PLAN: r0=184(x1), r1=63(y1), r2=251(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 63
LDI r2, 251
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
