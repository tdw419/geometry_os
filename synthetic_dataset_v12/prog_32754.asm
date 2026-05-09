; DESCRIPTION: Places a yellow line segment connecting (415, 25) to (139, 170).
; PLAN: r0=415(x1), r1=25(y1), r2=139(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 25
LDI r2, 139
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
