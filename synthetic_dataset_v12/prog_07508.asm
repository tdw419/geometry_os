; DESCRIPTION: Draws a magenta line from (164, 227) to (162, 130).
; PLAN: r0=164(x1), r1=227(y1), r2=162(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 227
LDI r2, 162
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
