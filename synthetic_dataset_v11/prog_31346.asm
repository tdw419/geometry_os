; DESCRIPTION: Draws a blue line from (21, 51) to (222, 69).
; PLAN: r0=21(x1), r1=51(y1), r2=222(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 51
LDI r2, 222
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
