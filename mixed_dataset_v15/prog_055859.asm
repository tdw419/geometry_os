; DESCRIPTION: Draws a blue line from (7, 41) to (282, 58).
; PLAN: r0=7(x1), r1=41(y1), r2=282(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 41
LDI r2, 282
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
