; DESCRIPTION: Places a yellow line segment connecting (504, 26) to (14, 62).
; PLAN: r0=504(x1), r1=26(y1), r2=14(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 26
LDI r2, 14
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
