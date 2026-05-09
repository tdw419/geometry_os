; DESCRIPTION: Places a yellow line segment connecting (62, 236) to (263, 139).
; PLAN: r0=62(x1), r1=236(y1), r2=263(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 236
LDI r2, 263
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
