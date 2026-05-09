; DESCRIPTION: Places a purple line segment connecting (82, 12) to (353, 192).
; PLAN: r0=82(x1), r1=12(y1), r2=353(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 12
LDI r2, 353
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
