; DESCRIPTION: Draws a red line from (132, 13) to (296, 13).
; PLAN: r0=132(x1), r1=13(y1), r2=296(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 13
LDI r2, 296
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
