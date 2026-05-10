; DESCRIPTION: Draws a blue line from (59, 252) to (29, 15).
; PLAN: r0=59(x1), r1=252(y1), r2=29(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 252
LDI r2, 29
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
