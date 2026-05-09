; DESCRIPTION: Places a cyan line segment connecting (157, 93) to (63, 151).
; PLAN: r0=157(x1), r1=93(y1), r2=63(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 93
LDI r2, 63
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
