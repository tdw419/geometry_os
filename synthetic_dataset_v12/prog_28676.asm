; DESCRIPTION: Draws a magenta line from (323, 239) to (99, 66).
; PLAN: r0=323(x1), r1=239(y1), r2=99(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 239
LDI r2, 99
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
