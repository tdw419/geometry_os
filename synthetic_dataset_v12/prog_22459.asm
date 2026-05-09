; DESCRIPTION: Draws a red line from (267, 217) to (426, 94).
; PLAN: r0=267(x1), r1=217(y1), r2=426(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 217
LDI r2, 426
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
