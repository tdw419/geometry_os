; DESCRIPTION: Places a purple line segment connecting (93, 12) to (203, 215).
; PLAN: r0=93(x1), r1=12(y1), r2=203(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 12
LDI r2, 203
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
