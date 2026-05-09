; DESCRIPTION: Draws a blue line from (302, 136) to (130, 166).
; PLAN: r0=302(x1), r1=136(y1), r2=130(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 136
LDI r2, 130
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
