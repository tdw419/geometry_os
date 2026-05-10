; DESCRIPTION: Places a blue line segment connecting (44, 107) to (192, 61).
; PLAN: r0=44(x1), r1=107(y1), r2=192(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 107
LDI r2, 192
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
