; DESCRIPTION: Places a yellow line segment connecting (478, 192) to (382, 68).
; PLAN: r0=478(x1), r1=192(y1), r2=382(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 192
LDI r2, 382
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
