; DESCRIPTION: Places a yellow line segment connecting (255, 110) to (282, 249).
; PLAN: r0=255(x1), r1=110(y1), r2=282(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 110
LDI r2, 282
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
