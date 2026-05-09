; DESCRIPTION: Draws a magenta line from (207, 206) to (56, 54).
; PLAN: r0=207(x1), r1=206(y1), r2=56(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 206
LDI r2, 56
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
