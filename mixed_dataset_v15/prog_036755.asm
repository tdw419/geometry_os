; DESCRIPTION: Draws a magenta line from (27, 10) to (369, 69).
; PLAN: r0=27(x1), r1=10(y1), r2=369(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 10
LDI r2, 369
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
