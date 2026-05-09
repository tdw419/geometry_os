; DESCRIPTION: Places a black line segment connecting (178, 150) to (359, 151).
; PLAN: r0=178(x1), r1=150(y1), r2=359(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 150
LDI r2, 359
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
