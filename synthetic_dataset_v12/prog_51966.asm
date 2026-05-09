; DESCRIPTION: Places a green line segment connecting (141, 195) to (62, 129).
; PLAN: r0=141(x1), r1=195(y1), r2=62(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 195
LDI r2, 62
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
