; DESCRIPTION: Draws a blue line from (194, 68) to (41, 198).
; PLAN: r0=194(x1), r1=68(y1), r2=41(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 68
LDI r2, 41
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
