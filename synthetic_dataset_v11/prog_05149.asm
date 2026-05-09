; DESCRIPTION: Draws a green line from (69, 136) to (188, 227).
; PLAN: r0=69(x1), r1=136(y1), r2=188(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 136
LDI r2, 188
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
