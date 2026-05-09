; DESCRIPTION: Places a cyan line segment connecting (125, 31) to (249, 151).
; PLAN: r0=125(x1), r1=31(y1), r2=249(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 31
LDI r2, 249
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
