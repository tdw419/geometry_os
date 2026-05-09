; DESCRIPTION: Draws a blue line from (437, 110) to (501, 204).
; PLAN: r0=437(x1), r1=110(y1), r2=501(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 110
LDI r2, 501
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
