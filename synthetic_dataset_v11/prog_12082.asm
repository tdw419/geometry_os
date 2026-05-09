; DESCRIPTION: Places a yellow line segment connecting (182, 128) to (21, 130).
; PLAN: r0=182(x1), r1=128(y1), r2=21(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 128
LDI r2, 21
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
