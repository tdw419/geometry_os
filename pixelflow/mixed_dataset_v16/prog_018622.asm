; DESCRIPTION: Places a purple line segment connecting (240, 95) to (421, 36).
; PLAN: r0=240(x1), r1=95(y1), r2=421(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 95
LDI r2, 421
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
