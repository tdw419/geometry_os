; DESCRIPTION: Draws a blue line from (315, 68) to (134, 55).
; PLAN: r0=315(x1), r1=68(y1), r2=134(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 68
LDI r2, 134
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
