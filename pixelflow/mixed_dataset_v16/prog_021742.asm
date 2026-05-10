; DESCRIPTION: Draws a magenta line from (280, 233) to (501, 110).
; PLAN: r0=280(x1), r1=233(y1), r2=501(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 233
LDI r2, 501
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
