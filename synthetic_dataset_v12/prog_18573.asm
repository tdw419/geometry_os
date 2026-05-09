; DESCRIPTION: Places a yellow line segment connecting (240, 255) to (448, 158).
; PLAN: r0=240(x1), r1=255(y1), r2=448(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 255
LDI r2, 448
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
