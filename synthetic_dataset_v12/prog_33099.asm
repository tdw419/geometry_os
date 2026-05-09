; DESCRIPTION: Draws a blue line from (355, 205) to (136, 218).
; PLAN: r0=355(x1), r1=205(y1), r2=136(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 205
LDI r2, 136
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
