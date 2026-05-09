; DESCRIPTION: Draws a blue line from (140, 255) to (84, 26).
; PLAN: r0=140(x1), r1=255(y1), r2=84(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 255
LDI r2, 84
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
