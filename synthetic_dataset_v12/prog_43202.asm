; DESCRIPTION: Places a green line segment connecting (185, 1) to (192, 143).
; PLAN: r0=185(x1), r1=1(y1), r2=192(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 1
LDI r2, 192
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
