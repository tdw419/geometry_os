; DESCRIPTION: Places a yellow line segment connecting (239, 179) to (110, 250).
; PLAN: r0=239(x1), r1=179(y1), r2=110(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 179
LDI r2, 110
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
