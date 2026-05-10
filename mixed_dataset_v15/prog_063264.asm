; DESCRIPTION: Draws a magenta line from (135, 223) to (9, 130).
; PLAN: r0=135(x1), r1=223(y1), r2=9(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 223
LDI r2, 9
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
