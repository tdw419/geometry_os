; DESCRIPTION: Places a purple line segment connecting (188, 67) to (128, 121).
; PLAN: r0=188(x1), r1=67(y1), r2=128(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 67
LDI r2, 128
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
