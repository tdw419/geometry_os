; DESCRIPTION: Draws a red line from (267, 28) to (89, 191).
; PLAN: r0=267(x1), r1=28(y1), r2=89(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 28
LDI r2, 89
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
