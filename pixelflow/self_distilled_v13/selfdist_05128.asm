; DESCRIPTION: Draws a magenta line from (25, 181) to (158, 128).
; PLAN: r0=25(x1), r1=181(y1), r2=158(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 181
LDI r2, 158
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
