; DESCRIPTION: Places a purple line segment connecting (30, 36) to (506, 95).
; PLAN: r0=30(x1), r1=36(y1), r2=506(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 36
LDI r2, 506
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
