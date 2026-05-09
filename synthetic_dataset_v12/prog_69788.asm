; DESCRIPTION: Draws a orange line from (204, 62) to (267, 8).
; PLAN: r0=204(x1), r1=62(y1), r2=267(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 62
LDI r2, 267
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
