; DESCRIPTION: Draws a magenta line from (88, 72) to (162, 122).
; PLAN: r0=88(x1), r1=72(y1), r2=162(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 72
LDI r2, 162
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
