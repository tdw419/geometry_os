; DESCRIPTION: Draws a blue line from (0, 43) to (222, 76).
; PLAN: r0=0(x1), r1=43(y1), r2=222(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 43
LDI r2, 222
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
