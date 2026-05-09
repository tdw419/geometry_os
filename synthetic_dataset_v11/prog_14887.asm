; DESCRIPTION: Places a green line segment connecting (212, 236) to (60, 151).
; PLAN: r0=212(x1), r1=236(y1), r2=60(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 236
LDI r2, 60
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
