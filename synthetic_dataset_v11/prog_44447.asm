; DESCRIPTION: Draws a magenta line from (11, 74) to (88, 65).
; PLAN: r0=11(x1), r1=74(y1), r2=88(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 74
LDI r2, 88
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
