; DESCRIPTION: Draws a blue line from (473, 174) to (353, 25).
; PLAN: r0=473(x1), r1=174(y1), r2=353(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 174
LDI r2, 353
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
