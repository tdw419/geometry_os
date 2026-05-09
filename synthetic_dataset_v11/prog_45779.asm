; DESCRIPTION: Draws a magenta line from (60, 97) to (181, 63).
; PLAN: r0=60(x1), r1=97(y1), r2=181(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 97
LDI r2, 181
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
