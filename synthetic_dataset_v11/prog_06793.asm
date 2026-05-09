; DESCRIPTION: Places a purple line segment connecting (210, 58) to (126, 37).
; PLAN: r0=210(x1), r1=58(y1), r2=126(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 58
LDI r2, 126
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
