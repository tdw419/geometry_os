; DESCRIPTION: Draws a magenta line from (454, 57) to (273, 176).
; PLAN: r0=454(x1), r1=57(y1), r2=273(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 57
LDI r2, 273
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
