; DESCRIPTION: Places a white line segment connecting (144, 119) to (278, 100).
; PLAN: r0=144(x1), r1=119(y1), r2=278(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 119
LDI r2, 278
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
