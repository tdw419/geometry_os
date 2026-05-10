; DESCRIPTION: Places a yellow line segment connecting (139, 122) to (370, 126).
; PLAN: r0=139(x1), r1=122(y1), r2=370(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 122
LDI r2, 370
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
