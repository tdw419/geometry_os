; DESCRIPTION: Places a green line segment connecting (470, 54) to (332, 151).
; PLAN: r0=470(x1), r1=54(y1), r2=332(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 54
LDI r2, 332
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
