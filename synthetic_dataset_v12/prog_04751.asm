; DESCRIPTION: Draws a blue line from (453, 10) to (194, 189).
; PLAN: r0=453(x1), r1=10(y1), r2=194(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 10
LDI r2, 194
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
