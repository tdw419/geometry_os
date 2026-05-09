; DESCRIPTION: Places a yellow line segment connecting (6, 179) to (22, 167).
; PLAN: r0=6(x1), r1=179(y1), r2=22(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 179
LDI r2, 22
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
