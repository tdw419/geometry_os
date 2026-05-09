; DESCRIPTION: Places a blue line segment connecting (167, 83) to (431, 104).
; PLAN: r0=167(x1), r1=83(y1), r2=431(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 83
LDI r2, 431
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
