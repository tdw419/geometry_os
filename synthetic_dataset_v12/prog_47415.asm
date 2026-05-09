; DESCRIPTION: Places a yellow line segment connecting (358, 47) to (192, 139).
; PLAN: r0=358(x1), r1=47(y1), r2=192(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 47
LDI r2, 192
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
