; DESCRIPTION: Draws a magenta line from (22, 102) to (117, 131).
; PLAN: r0=22(x1), r1=102(y1), r2=117(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 102
LDI r2, 117
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
