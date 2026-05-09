; DESCRIPTION: Places a yellow line segment connecting (326, 30) to (14, 43).
; PLAN: r0=326(x1), r1=30(y1), r2=14(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 30
LDI r2, 14
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
