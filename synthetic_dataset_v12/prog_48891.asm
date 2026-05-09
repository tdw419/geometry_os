; DESCRIPTION: Draws a blue line from (101, 100) to (240, 56).
; PLAN: r0=101(x1), r1=100(y1), r2=240(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 100
LDI r2, 240
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
