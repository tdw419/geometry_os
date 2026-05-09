; DESCRIPTION: Places a white line segment connecting (45, 58) to (33, 151).
; PLAN: r0=45(x1), r1=58(y1), r2=33(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 58
LDI r2, 33
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
