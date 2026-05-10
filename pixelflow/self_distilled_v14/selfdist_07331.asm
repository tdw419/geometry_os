; DESCRIPTION: Draws a blue line from (282, 61) to (122, 150).
; PLAN: r0=282(x1), r1=61(y1), r2=122(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 61
LDI r2, 122
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
