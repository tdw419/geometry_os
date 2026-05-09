; DESCRIPTION: Draws a magenta line from (92, 227) to (33, 84).
; PLAN: r0=92(x1), r1=227(y1), r2=33(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 227
LDI r2, 33
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
