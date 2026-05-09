; DESCRIPTION: Draws a blue line from (250, 127) to (102, 22).
; PLAN: r0=250(x1), r1=127(y1), r2=102(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 127
LDI r2, 102
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
