; DESCRIPTION: Places a blue line segment connecting (211, 71) to (255, 158).
; PLAN: r0=211(x1), r1=71(y1), r2=255(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 71
LDI r2, 255
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
