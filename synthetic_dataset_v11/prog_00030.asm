; DESCRIPTION: Draws a magenta line from (158, 238) to (222, 222).
; PLAN: r0=158(x1), r1=238(y1), r2=222(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 238
LDI r2, 222
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
