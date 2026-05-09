; DESCRIPTION: Places a yellow line segment connecting (230, 255) to (253, 75).
; PLAN: r0=230(x1), r1=255(y1), r2=253(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 255
LDI r2, 253
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
