; DESCRIPTION: Places a green line segment connecting (153, 215) to (201, 151).
; PLAN: r0=153(x1), r1=215(y1), r2=201(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 215
LDI r2, 201
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
