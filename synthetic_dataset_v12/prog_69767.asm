; DESCRIPTION: Places a yellow line segment connecting (327, 255) to (222, 94).
; PLAN: r0=327(x1), r1=255(y1), r2=222(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 255
LDI r2, 222
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
