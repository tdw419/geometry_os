; DESCRIPTION: Places a purple line segment connecting (260, 126) to (452, 255).
; PLAN: r0=260(x1), r1=126(y1), r2=452(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 126
LDI r2, 452
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
