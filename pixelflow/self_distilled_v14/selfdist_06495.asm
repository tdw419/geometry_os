; DESCRIPTION: Draws a blue line from (359, 83) to (368, 39).
; PLAN: r0=359(x1), r1=83(y1), r2=368(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 83
LDI r2, 368
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
