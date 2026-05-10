; DESCRIPTION: Draws a magenta line from (181, 182) to (375, 168).
; PLAN: r0=181(x1), r1=182(y1), r2=375(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 182
LDI r2, 375
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
