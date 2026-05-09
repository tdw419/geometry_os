; DESCRIPTION: Draws a red line from (266, 66) to (350, 155).
; PLAN: r0=266(x1), r1=66(y1), r2=350(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 66
LDI r2, 350
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
