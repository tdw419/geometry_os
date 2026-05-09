; DESCRIPTION: Draws a blue line from (153, 73) to (302, 150).
; PLAN: r0=153(x1), r1=73(y1), r2=302(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 73
LDI r2, 302
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
