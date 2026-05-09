; DESCRIPTION: Draws a magenta line from (37, 52) to (188, 160).
; PLAN: r0=37(x1), r1=52(y1), r2=188(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 52
LDI r2, 188
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
