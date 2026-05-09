; DESCRIPTION: Places a blue line segment connecting (232, 204) to (236, 82).
; PLAN: r0=232(x1), r1=204(y1), r2=236(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 204
LDI r2, 236
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
