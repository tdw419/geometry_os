; DESCRIPTION: Places a cyan line segment connecting (64, 158) to (81, 144).
; PLAN: r0=64(x1), r1=158(y1), r2=81(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 158
LDI r2, 81
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
