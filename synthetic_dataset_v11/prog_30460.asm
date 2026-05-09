; DESCRIPTION: Draws a magenta line from (164, 182) to (158, 135).
; PLAN: r0=164(x1), r1=182(y1), r2=158(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 182
LDI r2, 158
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
