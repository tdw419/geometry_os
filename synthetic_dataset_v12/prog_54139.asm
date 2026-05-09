; DESCRIPTION: Places a purple line segment connecting (32, 220) to (35, 25).
; PLAN: r0=32(x1), r1=220(y1), r2=35(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 220
LDI r2, 35
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
