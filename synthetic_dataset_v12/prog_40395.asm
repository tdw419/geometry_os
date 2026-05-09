; DESCRIPTION: Draws a blue line from (170, 139) to (28, 23).
; PLAN: r0=170(x1), r1=139(y1), r2=28(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 139
LDI r2, 28
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
