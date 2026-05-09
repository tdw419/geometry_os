; DESCRIPTION: Draws a orange line from (261, 199) to (267, 142).
; PLAN: r0=261(x1), r1=199(y1), r2=267(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 199
LDI r2, 267
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
