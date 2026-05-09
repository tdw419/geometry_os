; DESCRIPTION: Places a green line segment connecting (234, 192) to (114, 62).
; PLAN: r0=234(x1), r1=192(y1), r2=114(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 192
LDI r2, 114
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
