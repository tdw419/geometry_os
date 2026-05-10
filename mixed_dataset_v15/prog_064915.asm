; DESCRIPTION: Draws a magenta line from (80, 88) to (369, 245).
; PLAN: r0=80(x1), r1=88(y1), r2=369(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 88
LDI r2, 369
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
