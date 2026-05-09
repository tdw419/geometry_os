; DESCRIPTION: Places a yellow line segment connecting (255, 251) to (35, 81).
; PLAN: r0=255(x1), r1=251(y1), r2=35(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 251
LDI r2, 35
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
