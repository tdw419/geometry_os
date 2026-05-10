; DESCRIPTION: Draws a magenta line from (165, 101) to (431, 20).
; PLAN: r0=165(x1), r1=101(y1), r2=431(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 101
LDI r2, 431
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
