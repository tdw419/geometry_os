; DESCRIPTION: Places a purple line segment connecting (69, 37) to (195, 6).
; PLAN: r0=69(x1), r1=37(y1), r2=195(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 37
LDI r2, 195
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
