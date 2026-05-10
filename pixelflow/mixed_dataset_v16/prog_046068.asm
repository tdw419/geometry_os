; DESCRIPTION: Places a green line segment connecting (504, 232) to (371, 191).
; PLAN: r0=504(x1), r1=232(y1), r2=371(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 232
LDI r2, 371
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
