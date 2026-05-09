; DESCRIPTION: Places a purple line segment connecting (64, 14) to (81, 91).
; PLAN: r0=64(x1), r1=14(y1), r2=81(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 14
LDI r2, 81
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
