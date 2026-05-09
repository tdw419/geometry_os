; DESCRIPTION: Places a purple line segment connecting (173, 105) to (69, 179).
; PLAN: r0=173(x1), r1=105(y1), r2=69(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 105
LDI r2, 69
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
