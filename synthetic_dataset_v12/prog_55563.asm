; DESCRIPTION: Places a blue line segment connecting (192, 172) to (342, 189).
; PLAN: r0=192(x1), r1=172(y1), r2=342(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 172
LDI r2, 342
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
