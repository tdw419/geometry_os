; DESCRIPTION: Draws a blue line from (86, 91) to (436, 169).
; PLAN: r0=86(x1), r1=91(y1), r2=436(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 91
LDI r2, 436
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
