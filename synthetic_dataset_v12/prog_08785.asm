; DESCRIPTION: Draws a magenta line from (85, 92) to (44, 7).
; PLAN: r0=85(x1), r1=92(y1), r2=44(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 92
LDI r2, 44
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
