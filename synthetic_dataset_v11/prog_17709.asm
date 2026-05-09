; DESCRIPTION: Places a yellow line segment connecting (176, 182) to (204, 22).
; PLAN: r0=176(x1), r1=182(y1), r2=204(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 182
LDI r2, 204
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
