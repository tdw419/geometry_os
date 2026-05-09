; DESCRIPTION: Places a green line segment connecting (315, 60) to (205, 151).
; PLAN: r0=315(x1), r1=60(y1), r2=205(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 60
LDI r2, 205
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
