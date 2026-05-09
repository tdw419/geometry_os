; DESCRIPTION: Draws a blue line from (473, 46) to (56, 216).
; PLAN: r0=473(x1), r1=46(y1), r2=56(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 46
LDI r2, 56
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
