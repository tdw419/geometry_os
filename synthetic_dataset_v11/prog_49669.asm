; DESCRIPTION: Places a purple line segment connecting (187, 249) to (67, 12).
; PLAN: r0=187(x1), r1=249(y1), r2=67(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 249
LDI r2, 67
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
