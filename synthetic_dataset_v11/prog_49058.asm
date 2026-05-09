; DESCRIPTION: Draws a blue line from (33, 72) to (58, 203).
; PLAN: r0=33(x1), r1=72(y1), r2=58(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 72
LDI r2, 58
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
