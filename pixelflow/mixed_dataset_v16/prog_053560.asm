; DESCRIPTION: Draws a red line from (3, 232) to (267, 0).
; PLAN: r0=3(x1), r1=232(y1), r2=267(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 232
LDI r2, 267
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
