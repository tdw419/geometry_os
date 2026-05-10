; DESCRIPTION: Places a blue line segment connecting (54, 83) to (248, 166).
; PLAN: r0=54(x1), r1=83(y1), r2=248(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 83
LDI r2, 248
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
