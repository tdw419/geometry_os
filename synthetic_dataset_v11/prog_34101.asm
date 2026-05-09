; DESCRIPTION: Places a blue line segment connecting (98, 61) to (211, 206).
; PLAN: r0=98(x1), r1=61(y1), r2=211(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 61
LDI r2, 211
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
