; DESCRIPTION: Draws a magenta line from (377, 102) to (362, 245).
; PLAN: r0=377(x1), r1=102(y1), r2=362(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 102
LDI r2, 362
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
