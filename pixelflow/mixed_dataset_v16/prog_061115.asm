; DESCRIPTION: Places a white line segment connecting (59, 190) to (256, 151).
; PLAN: r0=59(x1), r1=190(y1), r2=256(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 190
LDI r2, 256
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
