; DESCRIPTION: Draws a blue line from (213, 222) to (163, 255).
; PLAN: r0=213(x1), r1=222(y1), r2=163(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 222
LDI r2, 163
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
