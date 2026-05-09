; DESCRIPTION: Draws a blue line from (420, 161) to (188, 22).
; PLAN: r0=420(x1), r1=161(y1), r2=188(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 161
LDI r2, 188
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
