; DESCRIPTION: Draws a blue line from (501, 62) to (368, 142).
; PLAN: r0=501(x1), r1=62(y1), r2=368(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 62
LDI r2, 368
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
