; DESCRIPTION: Draws a magenta line from (483, 0) to (296, 116).
; PLAN: r0=483(x1), r1=0(y1), r2=296(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 0
LDI r2, 296
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
