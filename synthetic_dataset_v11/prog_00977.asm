; DESCRIPTION: Places a green line segment connecting (205, 103) to (0, 151).
; PLAN: r0=205(x1), r1=103(y1), r2=0(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 103
LDI r2, 0
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
