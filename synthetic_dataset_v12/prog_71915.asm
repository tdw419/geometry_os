; DESCRIPTION: Draws a blue line from (170, 222) to (408, 255).
; PLAN: r0=170(x1), r1=222(y1), r2=408(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 222
LDI r2, 408
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
