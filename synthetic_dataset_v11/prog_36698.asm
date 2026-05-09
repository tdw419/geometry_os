; DESCRIPTION: Places a purple line segment connecting (1, 209) to (116, 159).
; PLAN: r0=1(x1), r1=209(y1), r2=116(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 209
LDI r2, 116
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
