; DESCRIPTION: Draws a blue line from (1, 170) to (47, 135).
; PLAN: r0=1(x1), r1=170(y1), r2=47(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 170
LDI r2, 47
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
