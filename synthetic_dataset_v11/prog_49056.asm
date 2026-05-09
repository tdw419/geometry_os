; DESCRIPTION: Draws a blue line from (222, 206) to (21, 22).
; PLAN: r0=222(x1), r1=206(y1), r2=21(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 206
LDI r2, 21
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
