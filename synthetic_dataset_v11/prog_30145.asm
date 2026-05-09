; DESCRIPTION: Places a purple line segment connecting (9, 195) to (29, 184).
; PLAN: r0=9(x1), r1=195(y1), r2=29(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 195
LDI r2, 29
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
