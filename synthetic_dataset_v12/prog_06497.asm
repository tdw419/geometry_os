; DESCRIPTION: Draws a blue line from (454, 216) to (8, 161).
; PLAN: r0=454(x1), r1=216(y1), r2=8(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 216
LDI r2, 8
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
