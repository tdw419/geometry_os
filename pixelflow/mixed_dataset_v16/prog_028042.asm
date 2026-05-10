; DESCRIPTION: Draws a blue line from (299, 203) to (29, 227).
; PLAN: r0=299(x1), r1=203(y1), r2=29(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 203
LDI r2, 29
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
