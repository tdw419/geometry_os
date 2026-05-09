; DESCRIPTION: Draws a magenta line from (194, 53) to (0, 163).
; PLAN: r0=194(x1), r1=53(y1), r2=0(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 53
LDI r2, 0
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
