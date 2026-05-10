; DESCRIPTION: Places a purple line segment connecting (329, 20) to (6, 139).
; PLAN: r0=329(x1), r1=20(y1), r2=6(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 20
LDI r2, 6
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
