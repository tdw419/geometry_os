; DESCRIPTION: Places a yellow line segment connecting (204, 255) to (260, 104).
; PLAN: r0=204(x1), r1=255(y1), r2=260(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 255
LDI r2, 260
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
