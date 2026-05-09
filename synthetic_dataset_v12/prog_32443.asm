; DESCRIPTION: Places a blue line segment connecting (192, 158) to (82, 156).
; PLAN: r0=192(x1), r1=158(y1), r2=82(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 158
LDI r2, 82
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
