; DESCRIPTION: Draws a magenta line from (0, 174) to (501, 0).
; PLAN: r0=0(x1), r1=174(y1), r2=501(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 174
LDI r2, 501
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
