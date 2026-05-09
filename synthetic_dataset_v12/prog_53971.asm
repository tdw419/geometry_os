; DESCRIPTION: Places a purple line segment connecting (327, 49) to (337, 242).
; PLAN: r0=327(x1), r1=49(y1), r2=337(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 49
LDI r2, 337
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
