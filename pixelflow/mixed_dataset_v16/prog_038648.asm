; DESCRIPTION: Draws a magenta line from (381, 157) to (80, 155).
; PLAN: r0=381(x1), r1=157(y1), r2=80(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 157
LDI r2, 80
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
