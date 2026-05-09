; DESCRIPTION: Draws a magenta line from (95, 23) to (78, 158).
; PLAN: r0=95(x1), r1=23(y1), r2=78(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 23
LDI r2, 78
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
