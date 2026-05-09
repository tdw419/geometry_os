; DESCRIPTION: Draws a magenta line from (375, 66) to (501, 123).
; PLAN: r0=375(x1), r1=66(y1), r2=501(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 66
LDI r2, 501
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
