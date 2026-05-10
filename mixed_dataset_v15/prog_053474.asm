; DESCRIPTION: Draws a magenta line from (61, 153) to (191, 23).
; PLAN: r0=61(x1), r1=153(y1), r2=191(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 153
LDI r2, 191
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
