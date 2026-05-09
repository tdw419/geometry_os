; DESCRIPTION: Places a purple line segment connecting (13, 15) to (481, 126).
; PLAN: r0=13(x1), r1=15(y1), r2=481(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 15
LDI r2, 481
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
