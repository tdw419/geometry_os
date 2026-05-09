; DESCRIPTION: Places a purple line segment connecting (5, 118) to (113, 95).
; PLAN: r0=5(x1), r1=118(y1), r2=113(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 118
LDI r2, 113
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
