; DESCRIPTION: Draws a blue line from (77, 174) to (136, 65).
; PLAN: r0=77(x1), r1=174(y1), r2=136(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 174
LDI r2, 136
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
