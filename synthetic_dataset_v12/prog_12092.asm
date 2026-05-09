; DESCRIPTION: Places a purple line segment connecting (291, 50) to (275, 87).
; PLAN: r0=291(x1), r1=50(y1), r2=275(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 50
LDI r2, 275
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
