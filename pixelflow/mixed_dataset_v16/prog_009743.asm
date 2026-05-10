; DESCRIPTION: Draws a blue line from (122, 30) to (29, 8).
; PLAN: r0=122(x1), r1=30(y1), r2=29(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 30
LDI r2, 29
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
