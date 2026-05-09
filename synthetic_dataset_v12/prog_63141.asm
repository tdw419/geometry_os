; DESCRIPTION: Draws a magenta line from (197, 212) to (357, 86).
; PLAN: r0=197(x1), r1=212(y1), r2=357(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 212
LDI r2, 357
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
