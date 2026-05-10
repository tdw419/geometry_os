; DESCRIPTION: Draws a magenta line from (102, 181) to (259, 115).
; PLAN: r0=102(x1), r1=181(y1), r2=259(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 181
LDI r2, 259
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
