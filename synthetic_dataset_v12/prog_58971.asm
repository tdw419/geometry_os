; DESCRIPTION: Draws a magenta line from (291, 185) to (130, 244).
; PLAN: r0=291(x1), r1=185(y1), r2=130(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 185
LDI r2, 130
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
