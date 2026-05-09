; DESCRIPTION: Places a cyan line segment connecting (150, 21) to (170, 151).
; PLAN: r0=150(x1), r1=21(y1), r2=170(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 21
LDI r2, 170
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
