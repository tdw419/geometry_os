; DESCRIPTION: Draws a magenta line from (63, 202) to (212, 248).
; PLAN: r0=63(x1), r1=202(y1), r2=212(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 202
LDI r2, 212
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
