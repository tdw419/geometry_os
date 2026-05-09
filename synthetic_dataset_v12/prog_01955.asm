; DESCRIPTION: Draws a red line from (267, 3) to (70, 56).
; PLAN: r0=267(x1), r1=3(y1), r2=70(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 3
LDI r2, 70
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
