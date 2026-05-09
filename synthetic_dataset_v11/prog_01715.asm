; DESCRIPTION: Places a purple line segment connecting (209, 8) to (109, 178).
; PLAN: r0=209(x1), r1=8(y1), r2=109(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 8
LDI r2, 109
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
