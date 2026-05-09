; DESCRIPTION: Renders a purple line between points (374, 68) and (476, 63).
; PLAN: r0=374(x1), r1=68(y1), r2=476(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 68
LDI r2, 476
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
