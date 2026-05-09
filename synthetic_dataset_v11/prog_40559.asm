; DESCRIPTION: Draws a blue line from (140, 145) to (69, 139).
; PLAN: r0=140(x1), r1=145(y1), r2=69(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 145
LDI r2, 69
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
