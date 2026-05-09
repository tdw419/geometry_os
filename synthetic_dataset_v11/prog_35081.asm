; DESCRIPTION: Places a yellow line segment connecting (146, 218) to (209, 151).
; PLAN: r0=146(x1), r1=218(y1), r2=209(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 218
LDI r2, 209
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
