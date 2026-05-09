; DESCRIPTION: Draws a magenta line from (300, 102) to (77, 198).
; PLAN: r0=300(x1), r1=102(y1), r2=77(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 102
LDI r2, 77
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
