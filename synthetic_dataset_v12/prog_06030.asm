; DESCRIPTION: Draws a cyan line from (21, 140) to (0, 151).
; PLAN: r0=21(x1), r1=140(y1), r2=0(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 140
LDI r2, 0
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
