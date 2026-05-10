; DESCRIPTION: Places a purple line segment connecting (37, 215) to (32, 26).
; PLAN: r0=37(x1), r1=215(y1), r2=32(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 215
LDI r2, 32
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
