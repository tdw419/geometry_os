; DESCRIPTION: Places a purple line segment connecting (1, 173) to (203, 239).
; PLAN: r0=1(x1), r1=173(y1), r2=203(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 173
LDI r2, 203
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
