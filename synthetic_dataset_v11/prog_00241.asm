; DESCRIPTION: Draws a magenta line from (92, 6) to (142, 75).
; PLAN: r0=92(x1), r1=6(y1), r2=142(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 6
LDI r2, 142
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
