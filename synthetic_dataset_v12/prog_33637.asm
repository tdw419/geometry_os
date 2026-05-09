; DESCRIPTION: Draws a blue line from (222, 144) to (466, 39).
; PLAN: r0=222(x1), r1=144(y1), r2=466(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 144
LDI r2, 466
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
