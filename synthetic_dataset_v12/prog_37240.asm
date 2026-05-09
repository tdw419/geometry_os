; DESCRIPTION: Places a yellow line segment connecting (504, 210) to (457, 151).
; PLAN: r0=504(x1), r1=210(y1), r2=457(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 210
LDI r2, 457
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
