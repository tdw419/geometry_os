; DESCRIPTION: Places a blue line segment connecting (11, 155) to (116, 221).
; PLAN: r0=11(x1), r1=155(y1), r2=116(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 155
LDI r2, 116
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
