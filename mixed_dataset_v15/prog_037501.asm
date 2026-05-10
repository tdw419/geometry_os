; DESCRIPTION: Draws a blue line from (101, 140) to (0, 3).
; PLAN: r0=101(x1), r1=140(y1), r2=0(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 140
LDI r2, 0
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
