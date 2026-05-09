; DESCRIPTION: Draws a magenta line from (14, 157) to (84, 11).
; PLAN: r0=14(x1), r1=157(y1), r2=84(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 157
LDI r2, 84
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
