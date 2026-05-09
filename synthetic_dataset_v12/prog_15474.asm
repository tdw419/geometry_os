; DESCRIPTION: Places a blue line segment connecting (348, 203) to (94, 166).
; PLAN: r0=348(x1), r1=203(y1), r2=94(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 203
LDI r2, 94
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
