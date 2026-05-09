; DESCRIPTION: Places a purple line segment connecting (126, 5) to (499, 1).
; PLAN: r0=126(x1), r1=5(y1), r2=499(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 5
LDI r2, 499
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
