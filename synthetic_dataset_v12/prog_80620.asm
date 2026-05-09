; DESCRIPTION: Draws a magenta line from (169, 114) to (182, 194).
; PLAN: r0=169(x1), r1=114(y1), r2=182(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 114
LDI r2, 182
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
