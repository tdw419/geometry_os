; DESCRIPTION: Places a purple line segment connecting (173, 81) to (180, 101).
; PLAN: r0=173(x1), r1=81(y1), r2=180(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 81
LDI r2, 180
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
