; DESCRIPTION: Places a purple line segment connecting (344, 131) to (473, 153).
; PLAN: r0=344(x1), r1=131(y1), r2=473(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 131
LDI r2, 473
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
