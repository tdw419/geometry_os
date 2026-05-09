; DESCRIPTION: Draws a blue line from (142, 194) to (86, 69).
; PLAN: r0=142(x1), r1=194(y1), r2=86(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 194
LDI r2, 86
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
