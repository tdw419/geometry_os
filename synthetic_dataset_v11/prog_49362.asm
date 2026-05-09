; DESCRIPTION: Places a purple line segment connecting (173, 35) to (115, 167).
; PLAN: r0=173(x1), r1=35(y1), r2=115(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 35
LDI r2, 115
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
