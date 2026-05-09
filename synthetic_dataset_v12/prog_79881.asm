; DESCRIPTION: Places a yellow line segment connecting (505, 249) to (97, 67).
; PLAN: r0=505(x1), r1=249(y1), r2=97(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 249
LDI r2, 97
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
