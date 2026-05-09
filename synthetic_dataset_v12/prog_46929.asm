; DESCRIPTION: Draws a magenta line from (359, 75) to (252, 58).
; PLAN: r0=359(x1), r1=75(y1), r2=252(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 75
LDI r2, 252
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
