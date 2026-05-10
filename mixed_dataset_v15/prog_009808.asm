; DESCRIPTION: Draws a magenta line from (153, 11) to (100, 0).
; PLAN: r0=153(x1), r1=11(y1), r2=100(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 11
LDI r2, 100
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
