; DESCRIPTION: Draws a magenta line from (148, 2) to (100, 148).
; PLAN: r0=148(x1), r1=2(y1), r2=100(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 2
LDI r2, 100
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
