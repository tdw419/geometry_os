; DESCRIPTION: Places a purple line segment connecting (79, 224) to (173, 246).
; PLAN: r0=79(x1), r1=224(y1), r2=173(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 224
LDI r2, 173
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
