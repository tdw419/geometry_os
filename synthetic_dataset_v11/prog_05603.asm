; DESCRIPTION: Draws a blue line from (110, 253) to (72, 136).
; PLAN: r0=110(x1), r1=253(y1), r2=72(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 253
LDI r2, 72
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
