; DESCRIPTION: Places a purple line segment connecting (499, 4) to (247, 76).
; PLAN: r0=499(x1), r1=4(y1), r2=247(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 4
LDI r2, 247
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
