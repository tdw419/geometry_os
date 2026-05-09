; DESCRIPTION: Draws a blue line from (103, 4) to (211, 136).
; PLAN: r0=103(x1), r1=4(y1), r2=211(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 4
LDI r2, 211
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
