; DESCRIPTION: Draws a blue line from (13, 138) to (38, 252).
; PLAN: r0=13(x1), r1=138(y1), r2=38(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 138
LDI r2, 38
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
