; DESCRIPTION: Draws a magenta line from (100, 43) to (105, 96).
; PLAN: r0=100(x1), r1=43(y1), r2=105(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 43
LDI r2, 105
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
