; DESCRIPTION: Draws a magenta line from (240, 170) to (390, 189).
; PLAN: r0=240(x1), r1=170(y1), r2=390(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 170
LDI r2, 390
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
