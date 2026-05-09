; DESCRIPTION: Places a cyan line segment connecting (69, 87) to (185, 151).
; PLAN: r0=69(x1), r1=87(y1), r2=185(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 87
LDI r2, 185
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
