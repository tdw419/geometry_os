; DESCRIPTION: Draws a magenta line from (78, 182) to (98, 169).
; PLAN: r0=78(x1), r1=182(y1), r2=98(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 182
LDI r2, 98
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
