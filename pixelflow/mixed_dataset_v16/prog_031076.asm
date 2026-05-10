; DESCRIPTION: Draws a magenta line from (20, 248) to (169, 109).
; PLAN: r0=20(x1), r1=248(y1), r2=169(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 248
LDI r2, 169
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
