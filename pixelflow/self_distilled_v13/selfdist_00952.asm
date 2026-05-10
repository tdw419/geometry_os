; DESCRIPTION: Draws a blue line from (282, 10) to (379, 22).
; PLAN: r0=282(x1), r1=10(y1), r2=379(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 10
LDI r2, 379
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
