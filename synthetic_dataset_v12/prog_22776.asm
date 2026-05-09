; DESCRIPTION: Places a white line segment connecting (210, 248) to (192, 58).
; PLAN: r0=210(x1), r1=248(y1), r2=192(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 248
LDI r2, 192
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
