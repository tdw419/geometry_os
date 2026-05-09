; DESCRIPTION: Places a purple line segment connecting (333, 179) to (168, 1).
; PLAN: r0=333(x1), r1=179(y1), r2=168(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 179
LDI r2, 168
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
