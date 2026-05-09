; DESCRIPTION: Places a purple line segment connecting (32, 3) to (499, 139).
; PLAN: r0=32(x1), r1=3(y1), r2=499(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 3
LDI r2, 499
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
