; DESCRIPTION: Places a white line segment connecting (409, 88) to (231, 175).
; PLAN: r0=409(x1), r1=88(y1), r2=231(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 88
LDI r2, 231
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
