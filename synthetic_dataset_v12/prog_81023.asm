; DESCRIPTION: Draws a magenta line from (414, 144) to (367, 13).
; PLAN: r0=414(x1), r1=144(y1), r2=367(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 144
LDI r2, 367
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
