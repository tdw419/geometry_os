; DESCRIPTION: Draws a magenta line from (169, 78) to (405, 194).
; PLAN: r0=169(x1), r1=78(y1), r2=405(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 78
LDI r2, 405
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
