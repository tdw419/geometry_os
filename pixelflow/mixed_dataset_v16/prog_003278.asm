; DESCRIPTION: Draws a magenta line from (69, 22) to (246, 123).
; PLAN: r0=69(x1), r1=22(y1), r2=246(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 22
LDI r2, 246
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
