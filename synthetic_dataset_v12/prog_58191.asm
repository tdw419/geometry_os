; DESCRIPTION: Draws a orange line from (267, 91) to (252, 63).
; PLAN: r0=267(x1), r1=91(y1), r2=252(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 91
LDI r2, 252
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
