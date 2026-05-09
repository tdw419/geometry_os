; DESCRIPTION: Places a purple line segment connecting (244, 175) to (242, 204).
; PLAN: r0=244(x1), r1=175(y1), r2=242(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 175
LDI r2, 242
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
