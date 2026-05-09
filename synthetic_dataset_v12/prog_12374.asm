; DESCRIPTION: Draws a blue line from (116, 183) to (282, 119).
; PLAN: r0=116(x1), r1=183(y1), r2=282(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 183
LDI r2, 282
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
