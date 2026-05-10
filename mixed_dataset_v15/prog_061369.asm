; DESCRIPTION: Places a yellow line segment connecting (58, 191) to (504, 208).
; PLAN: r0=58(x1), r1=191(y1), r2=504(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 191
LDI r2, 504
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
