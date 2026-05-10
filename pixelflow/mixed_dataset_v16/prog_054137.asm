; DESCRIPTION: Draws a magenta line from (66, 252) to (335, 52).
; PLAN: r0=66(x1), r1=252(y1), r2=335(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 252
LDI r2, 335
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
