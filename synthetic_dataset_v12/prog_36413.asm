; DESCRIPTION: Draws a blue line from (243, 158) to (142, 45).
; PLAN: r0=243(x1), r1=158(y1), r2=142(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 158
LDI r2, 142
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
