; DESCRIPTION: Draws a blue line from (62, 164) to (188, 208).
; PLAN: r0=62(x1), r1=164(y1), r2=188(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 164
LDI r2, 188
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
