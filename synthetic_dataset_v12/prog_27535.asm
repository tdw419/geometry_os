; DESCRIPTION: Draws a magenta line from (89, 36) to (267, 250).
; PLAN: r0=89(x1), r1=36(y1), r2=267(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 36
LDI r2, 267
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
