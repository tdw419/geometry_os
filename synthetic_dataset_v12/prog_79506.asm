; DESCRIPTION: Draws a magenta line from (121, 144) to (66, 212).
; PLAN: r0=121(x1), r1=144(y1), r2=66(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 144
LDI r2, 66
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
