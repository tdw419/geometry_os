; DESCRIPTION: Draws a red line from (376, 17) to (267, 6).
; PLAN: r0=376(x1), r1=17(y1), r2=267(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 17
LDI r2, 267
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
